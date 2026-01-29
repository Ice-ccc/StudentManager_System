package com.controller;

import com.pojo.Course;
import com.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.dao.DuplicateKeyException;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    // 正则表达式：校验是否为整数（正整数）
    private static final Pattern INTEGER_PATTERN = Pattern.compile("^[1-9]\\d*$");
    
    // 新增：跳转到课程管理功能中心页面
    @RequestMapping("/toCourseManageCenter")
    public String toCourseManageCenter() {
        return "courseManageCenter"; // 对应新建的courseManageCenter.jsp
    }

    // ------------------- 新增课程 -------------------（保持不变）
    @RequestMapping("/toAddCourse")
    public String toAddCourse() {
        return "addCourse";
    }

    @RequestMapping("/addCourse")
    public String addCourse(
            @RequestParam("Cno") String CnoStr,
            @RequestParam("Cname") String Cname,
            @RequestParam("Credit") String CreditStr,
            @RequestParam(value = "Comment", required = false) String Comment,
            Model model) {
        try {
            // 1. 课程编号校验（必须是整数）
            Integer Cno;
            try {
                Cno = Integer.parseInt(CnoStr);
            } catch (NumberFormatException e) {
                model.addAttribute("errorMsg", "课程编号必须是整数！");
                return "alert";
            }

            // 2. 课程学分校验（必须是1-10的整数）
            Integer Credit;
            try {
                Credit = Integer.parseInt(CreditStr);
            } catch (NumberFormatException e) {
                model.addAttribute("errorMsg", "学分必须是整数！");
                return "alert";
            }
            if (Credit < 1 || Credit > 10) {
                model.addAttribute("errorMsg", "学分必须是1-10之间的整数！");
                return "alert";
            }

            // 3. 课程名称非空校验
            if (Cname == null || Cname.trim().isEmpty()) {
                model.addAttribute("errorMsg", "课程名称不能为空！");
                return "alert";
            }

            // 4. 封装Course对象，执行新增
            Course course = new Course();
            course.setCno(Cno);
            course.setCname(Cname.trim());
            course.setCredit(Credit);
            course.setComment(Comment != null ? Comment.trim() : "");

            int result = courseService.addCourse(course);
            if (result > 0) {
                return "addCourseSuccess";
            } else {
                model.addAttribute("errorMsg", "新增课程失败，请重试！");
                return "alert";
            }

        } catch (DuplicateKeyException e) {
            model.addAttribute("errorMsg", "课程编号已存在，请更换！");
            return "alert";
        } catch (Exception e) {
            model.addAttribute("errorMsg", "新增失败：" + e.getMessage());
            return "alert";
        }
    }

    // ------------------- 删除课程 -------------------（修改异常传递方式）
    @RequestMapping("/toDeleteCourse")
    public String toDeleteCourse() {
        return "deleteCourse";
    }

    @RequestMapping("/deleteCourse")
    public String deleteCourse(@RequestParam("CnoStr") String CnoStr, Model model) {
        try {
            // 校验课程编号格式（必须是正整数）
            if (!INTEGER_PATTERN.matcher(CnoStr).matches()) {
                model.addAttribute("errorMsg", "课程编号必须是正整数！");
                return "alert";
            }
            int Cno = Integer.parseInt(CnoStr);

            // 校验课程是否存在
            Course course = courseService.getCourseByCno(Cno);
            if (course == null) {
                model.addAttribute("errorMsg", "课程编号不存在！");
                return "alert";
            }

            int result = courseService.deleteCourseByCno(Cno);
            if (result > 0) {
                return "redirect:/toDeleteCourse?success=true";
            } else {
                model.addAttribute("errorMsg", "删除课程失败！");
                return "alert";
            }
        } catch (NumberFormatException e) {
            model.addAttribute("errorMsg", "课程编号格式错误，请输入正整数！");
            return "alert";
        } catch (Exception e) {
            model.addAttribute("errorMsg", "删除失败：" + e.getMessage());
            return "alert";
        }
    }

    // ------------------- 查询课程 -------------------（修改异常传递方式）
    @RequestMapping("/toQueryCourse")
    public String toQueryCourse() {
        return "queryCourse";
    }

    @RequestMapping("/queryCourseByCno")
    public String queryCourseByCno(@RequestParam("CnoStr") String CnoStr, HttpSession session, Model model) {
        try {
            // 校验课程编号格式（必须是正整数）
            if (!INTEGER_PATTERN.matcher(CnoStr).matches()) {
                model.addAttribute("errorMsg", "课程编号必须是正整数！");
                return "alert";
            }
            int Cno = Integer.parseInt(CnoStr);

            Course course = courseService.getCourseByCno(Cno);
            if (course != null) {
                session.setAttribute("queryCourse", course);
                return "queryCourseResult";
            } else {
                model.addAttribute("errorMsg", "未找到该课程信息！");
                return "alert";
            }
        } catch (NumberFormatException e) {
            model.addAttribute("errorMsg", "课程编号格式错误，请输入正整数！");
            return "alert";
        }
    }

    @RequestMapping("/queryAllCourse")
    public String queryAllCourse(HttpSession session) {
        // 跳转到分页查询的第1页，不再直接查询所有课程
        return "redirect:showAllCourseByPageNo?pageNo=1";
    }
 // ------------------- 课程分页查询 -------------------
 // 1. 跳转到“查看所有课程”列表页（不变）
 @RequestMapping("/toShowAllCourse")
 public String toShowAllCourse() {
     return "allCourseList";
 }

 // 2. 处理“查询所有课程”请求：默认查询第1页
 @RequestMapping("/showAllCourse")
 public String showAllCourse(HttpSession session) {
     return showAllCourseByPageNo("1", session);
 }

 // 3. 处理“分页查询课程”请求（含异常处理）
 @RequestMapping("/showAllCourseByPageNo")
 public String showAllCourseByPageNo(
         @RequestParam(value = "pageNo", required = false) String pageNoStr,
         HttpSession session) {
     int pageNo = 1;
     try {
         pageNo = Integer.parseInt(pageNoStr);
     } catch (NumberFormatException e) {
         session.setAttribute("errorMsg", "页号格式不正确，请输入数字！");
         return "allCourseList";
     }
     int pageSize = 5; // 每页显示5条（与学生列表一致）
     int totalCount = courseService.countAllCourse();
     int totalPages = courseService.getTotalPages(pageSize);
     
     // 页号校验（避免越界）
     if (pageNo < 1) pageNo = 1;
     if (pageNo > totalPages && totalPages > 0) pageNo = totalPages;
     
     // 查询当前页数据
     List<Course> result = courseService.getCourseByPage(pageNo, pageSize);
     
     // 存储分页信息到Session
     session.setAttribute("allCourse", result);
     session.setAttribute("currentPage", pageNo);
     session.setAttribute("totalPages", totalPages);
     session.setAttribute("totalCount", totalCount);
     session.removeAttribute("errorMsg");
     return "allCourseList";
 }

 // 4. 上一页、下一页方法
 @RequestMapping("/coursePrevPage")
 public String coursePrevPage(HttpSession session) {
     Integer currentPage = (Integer) session.getAttribute("currentPage");
     currentPage = currentPage != null ? currentPage : 1;
     currentPage--;
     if (currentPage < 1) currentPage = 1;
     return "redirect:showAllCourseByPageNo?pageNo=" + currentPage;
 }

 @RequestMapping("/courseNextPage")
 public String courseNextPage(HttpSession session) {
     Integer currentPage = (Integer) session.getAttribute("currentPage");
     currentPage = currentPage != null ? currentPage : 1;
     Integer totalPages = (Integer) session.getAttribute("totalPages");
     if (totalPages == null) {
         totalPages = 1;
     }
     currentPage++;
     if (currentPage > totalPages) {
         currentPage = totalPages;
     }
     return "redirect:showAllCourseByPageNo?pageNo=" + currentPage;
 }
    // ------------------- 修改课程学分 -------------------（修改异常传递方式）
    @RequestMapping("/toUpdateCourseCredit")
    public String toUpdateCourseCredit() {
        return "updateCourseCredit";
    }

    @RequestMapping("/updateCourseCredit")
    public String updateCourseCredit(
            @RequestParam("CnoStr") String CnoStr,
            @RequestParam("newCreditStr") String newCreditStr,
            Model model) {
        try {
            // 1. 校验课程编号（必须是正整数）
            if (!INTEGER_PATTERN.matcher(CnoStr).matches()) {
                model.addAttribute("errorMsg", "课程编号必须是正整数！");
                return "alert";
            }
            int Cno = Integer.parseInt(CnoStr);

            // 2. 校验新学分（必须是1-10之间的整数）
            if (!INTEGER_PATTERN.matcher(newCreditStr).matches()) {
                model.addAttribute("errorMsg", "学分必须是整数！");
                return "alert";
            }
            int newCredit = Integer.parseInt(newCreditStr);
            if (newCredit < 1 || newCredit > 10) {
                model.addAttribute("errorMsg", "学分必须是1-10之间的整数！");
                return "alert";
            }

            // 3. 校验课程是否存在
            Course course = courseService.getCourseByCno(Cno);
            if (course == null) {
                model.addAttribute("errorMsg", "课程编号不存在！");
                return "alert";
            }

            // 4. 执行修改
            int result = courseService.updateCourseCredit(Cno, newCredit);
            if (result > 0) {
                return "updateCourseCreditSuccess";
            } else {
                model.addAttribute("errorMsg", "修改学分失败！");
                return "alert";
            }
        } catch (NumberFormatException e) {
            model.addAttribute("errorMsg", "课程编号或学分格式错误，请输入正整数！");
            return "alert";
        } catch (Exception e) {
            model.addAttribute("errorMsg", "修改失败：" + e.getMessage());
            return "alert";
        }
    }
}