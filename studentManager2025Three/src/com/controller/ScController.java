package com.controller;

import com.pojo.Course;
import com.pojo.Sc;
import com.service.CourseService;
import com.service.ScService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class ScController {

    @Autowired
    private ScService scService;  // 注入选课业务层

    @Autowired
    private CourseService courseService;  // 注入课程业务层（用于查询所有课程）

    // 正则：校验正整数
    private static final Pattern INTEGER_PATTERN = Pattern.compile("^[1-9]\\d*$");


    // 修改：将路径改为/toScChoose，避免和CourseController冲突
    @RequestMapping("/toScChoose")
    public String toChoose(HttpSession session) {
        // 校验登录态
        Integer sno = (Integer) session.getAttribute("sno");
        if (sno == null) {
            return "redirect:login.jsp";
        }
        return "Choose/choose";  // 这里的路径对应你的选课管理功能中心页面（比如choose.jsp）
    }


    // ------------------- 1. 学生选课功能 -------------------
    // 1.1 跳转到“学生选课”页面
    @RequestMapping("/toStudentChoose")
    public String toStudentChoose(HttpSession session, Model model) {
        // 获取当前登录学生的sno（从session中）
        Integer sno = (Integer) session.getAttribute("sno");
        if (sno == null) {
            return "redirect:login.jsp";  // 未登录则跳转到登录页
        }

        // 查询所有可选课程（用于页面下拉框选择）
        List<Course> allCourses = courseService.getAllCourse();
        model.addAttribute("allCourses", allCourses);

        return "Choose/studentChoose";  // 跳转到学生选课页面
    }

    // 1.2 执行“学生选课”操作
    @RequestMapping("/studentChoose")
    public String studentChoose(
            @RequestParam("cno") String cnoStr,
            HttpSession session,
            Model model) {
        // 1. 获取当前学生sno
        Integer sno = (Integer) session.getAttribute("sno");
        if (sno == null) {
            return "redirect:login.jsp";
        }

        // 2. 校验课程编号格式
        Integer cno;
        try {
            if (!INTEGER_PATTERN.matcher(cnoStr).matches()) {
                model.addAttribute("errorMsg", "课程编号必须是正整数！");
                return "alert";
            }
            cno = Integer.parseInt(cnoStr);
        } catch (NumberFormatException e) {
            model.addAttribute("errorMsg", "课程编号格式错误！");
            return "alert";
        }

        // 3. 校验课程是否存在
        Course course = courseService.getCourseByCno(cno);
        if (course == null) {
            model.addAttribute("errorMsg", "课程编号不存在！");
            return "alert";
        }

        // 4. 封装Sc对象（仅包含sno、cno、cname，去掉tname）
        Sc sc = new Sc(
                sno,
                cno,
                course.getCname()  // 从课程对象中获取课程名
        );

        try {
            int result = scService.addSc(sc);
            if (result > 0) {
                model.addAttribute("successMsg", "选课成功！");
                return "Choose/studentChooseSuccess";  // 选课成功页
            } else {
                model.addAttribute("errorMsg", "选课失败，请重试！");
                return "alert";
            }
        } catch (DuplicateKeyException e) {
            // 只精准捕获“重复选课”的唯一约束异常
            model.addAttribute("errorMsg", "你已选过该课程，不能重复选课！");
            return "alert";
        } catch (Exception e) {
            // 其他异常显示真实原因，方便排查
            model.addAttribute("errorMsg", "选课失败：" + e.getMessage());
            return "alert";
        }
    }


    // ------------------- 2. 学生退课功能 -------------------
    // 2.1 跳转到“学生退课”页面
    @RequestMapping("/toStudentDrop")
    public String toStudentDrop(HttpSession session, Model model) {
        // 获取当前学生sno
        Integer sno = (Integer) session.getAttribute("sno");
        if (sno == null) {
            return "redirect:login.jsp";
        }

        // 查询该学生已选的课程（用于页面显示）
        List<Course> selectedCourses = scService.getSelectedCoursesBySno(sno);
        model.addAttribute("selectedCourses", selectedCourses);

        return "Choose/studentDrop";  // 跳转到学生退课页面
    }

    // 2.2 执行“学生退课”操作
    @RequestMapping("/studentDrop")
    public String studentDrop(
            @RequestParam("cno") String cnoStr,
            HttpSession session,
            Model model) {
        // 1. 获取当前学生sno
        Integer sno = (Integer) session.getAttribute("sno");
        if (sno == null) {
            return "redirect:login.jsp";
        }

        // 2. 校验课程编号格式
        Integer cno;
        try {
            if (!INTEGER_PATTERN.matcher(cnoStr).matches()) {
                model.addAttribute("errorMsg", "课程编号必须是正整数！");
                return "alert";
            }
            cno = Integer.parseInt(cnoStr);
        } catch (NumberFormatException e) {
            model.addAttribute("errorMsg", "课程编号格式错误！");
            return "alert";
        }

        // 3. 执行退课
        int result = scService.deleteSc(sno, cno);
        if (result > 0) {
            model.addAttribute("successMsg", "退课成功！");
            return "Choose/studentDropSuccess";  // 退课成功页
        } else {
            model.addAttribute("errorMsg", "退课失败（你未选该课程）！");
            return "alert";
        }
    }


    // ------------------- 3. 查看选课功能 -------------------
    // 3.1 跳转到“查看选课”页面
    @RequestMapping("/toViewChoose")
    public String toViewChoose(HttpSession session, Model model) {
        // 获取当前学生sno
        Integer sno = (Integer) session.getAttribute("sno");
        if (sno == null) {
            return "redirect:login.jsp";
        }

        // 查询该学生已选的课程
        List<Course> selectedCourses = scService.getSelectedCoursesBySno(sno);
        model.addAttribute("selectedCourses", selectedCourses);

        return "Choose/viewChoose";  // 跳转到查看选课页面
    }


	 // ------------------- 4. 选课统计功能 -------------------
	 // 4.1 跳转到“选课统计”页面
	 @RequestMapping("/toChooseStat")
	 public String toChooseStat(HttpSession session, Model model) {
	     // 获取当前学生sno
	     Integer sno = (Integer) session.getAttribute("sno");
	     if (sno == null) {
	         return "redirect:login.jsp";
	     }
	     
	     // 查询当前学生选课数
	     int myScCount = scService.countScBySno(sno);
	     // 查询总课程数（所有可选课程的数量）
	     int totalCourseCount = courseService.countAllCourse(); // 新增：调用课程服务层的“统计所有课程”方法
	     
	     model.addAttribute("myScCount", myScCount);
	     model.addAttribute("totalCourseCount", totalCourseCount); // 新增：传递总课程数到页面
	
	     return "Choose/chooseStat";  // 跳转到选课统计页面
	 }

}