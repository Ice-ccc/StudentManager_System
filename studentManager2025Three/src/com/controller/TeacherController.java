package com.controller;

import com.pojo.Course;
import com.pojo.Teacher;
import com.service.CourseService;
import com.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/teacher") // 补充前缀，避免路径冲突
public class TeacherController {

    @Autowired
    private TeacherService teacherService;
    
    // 【新增】注入课程服务
    @Autowired
    private CourseService courseService; // 必须声明并注入

    // 跳转到教师管理功能中心
    @RequestMapping("/toManageteacher")
    public String toTeacherManage() {
        return "teacher/teacherManage";
    }

    // 跳转到新建教师页面
    @RequestMapping("/toAddteacher")
    public String toAddTeacher() {
        return "teacher/addTeacher";
    }

 // 处理新增教师提交
    @RequestMapping("/addTeacher")
    public String addTeacher(Teacher teacher, Model model) {
        try {
            // 1. 核心校验：查询该教师编号是否已存在
            Teacher existingTeacher = teacherService.getTeacherByTno(teacher.getTno());
            if (existingTeacher != null) {
                // 编号重复，设置错误信息并跳转到失败页面
                model.addAttribute("errorMsg", "教师编号" + teacher.getTno() + "已存在，无法重复添加！");
                return "teacher/addTeacherError"; // 跳转到失败页面
            }

            // 2. 编号唯一，执行新增
            teacherService.addTeacher(teacher);
            // 新增成功，跳转到成功页面
            return "teacher/addTeacherSuccess"; 
        } catch (RuntimeException e) {
            // 其他业务异常（如参数错误）
            model.addAttribute("errorMsg", e.getMessage());
            return "teacher/addTeacherError";
        } catch (Exception e) {
            // 系统异常
            model.addAttribute("errorMsg", "新增失败：" + e.getMessage());
            return "teacher/addTeacherError";
        }
    }

    // 跳转到教师选课页面
    @RequestMapping("/toChooseCourse") // 你的页面访问路径
    public String toChooseCourse(Model model) {
        // 1. 查询所有Cno为null的教师（未分配课程）
        List<Teacher> noCourseTeachers = teacherService.getTeachersByCnoNull();
        // 2. 必须把数据放到model里，变量名必须是noCourseTeachers
        model.addAttribute("noCourseTeachers", noCourseTeachers);
        
        // 3. 顺便把课程数据也传过去（页面要显示课程下拉框）
        List<Course> allCourses = courseService.getAllCourse();
        model.addAttribute("allCourses", allCourses);
        
        return "teacher/chooseTeacher"; // 对应jsp页面路径
    }
    
 // 在Controller中临时打印日志，确认数据是否存在
 // TeacherController.java
    @RequestMapping("/toAssignCourse") // 统一用这个路径
    public String toAssignCourse(Model model) {
        // 查未分配课程的教师
        List<Teacher> noCourseTeachers = teacherService.getTeachersByCnoNull();
        model.addAttribute("noCourseTeachers", noCourseTeachers);
        // 查所有课程
        List<Course> allCourses = courseService.getAllCourse();
        model.addAttribute("allCourses", allCourses);
        
        // 确保JSP路径正确：WEB-INF/jsp/teacher/chooseTeacher.jsp
        return "teacher/chooseTeacher"; 
    }

    // 处理课程分配提交
 // 正确写法（和表单name一致，必须大写T/C）：
    @RequestMapping("/assignCourseToTeacher")
    public String assignCourseToTeacher(Integer Tno, Integer Cno, Model model) {
        teacherService.updateTeacherCno(Tno, Cno); // 更新教师的Cno
        return "teacher/chooseTeacherSuccess";
    }

 // 跳转到修改教师课程页面
    @RequestMapping("/toUpdateTeacherCourse")
    public String toUpdateTeacherCourse() {
        return "teacher/updateTeacher";
    }

    // 根据教师编号查询教师，准备修改课程
    @RequestMapping("/toUpdateCourse")
    public String toUpdateCourse(Integer Tno, Model model) {
        try {
            // 查询教师信息
            Teacher teacher = teacherService.getTeacherByTno(Tno);
            if (teacher == null) {
                model.addAttribute("msg", "教师编号不存在！");
                return "teacher/updateTeacher";
            }
            // 查询所有课程（供选择）
            List<Course> allCourses = courseService.getAllCourse();
            model.addAttribute("teacher", teacher);
            model.addAttribute("allCourses", allCourses);
        } catch (Exception e) {
            model.addAttribute("msg", "查询失败：" + e.getMessage());
        }
        return "teacher/updateTeacher";
    }

    // 执行修改教师课程的操作
    @RequestMapping("/doUpdateCourse")
    public String doUpdateCourse(Integer Tno, Integer Cno, Model model) {
        try {
            // 调用已有的updateTeacherCno方法修改课程
            teacherService.updateTeacherCno(Tno, Cno);
            model.addAttribute("msg", "教师课程修改成功！");
        } catch (RuntimeException e) {
            model.addAttribute("msg", e.getMessage());
        } catch (Exception e) {
            model.addAttribute("msg", "修改失败：" + e.getMessage());
        }
        // 回显教师信息和课程列表
        Teacher teacher = teacherService.getTeacherByTno(Tno);
        List<Course> allCourses = courseService.getAllCourse();
        model.addAttribute("teacher", teacher);
        model.addAttribute("allCourses", allCourses);
        return "teacher/updateTeacher";
    }

 // 替换Controller中的queryAllTeacher方法
    @RequestMapping("/queryAllTeacher")
    public String queryAllTeacher(
            @RequestParam(defaultValue = "1") Integer currentPage,
            @RequestParam(defaultValue = "5") Integer pageSize,
            Model model) {
        try {
            // 1. 查询所有教师
            List<Teacher> allTeachers = teacherService.getAllTeachers();
            // 2. 手动分页
            int totalCount = allTeachers.size();
            int totalPages = (totalCount + pageSize - 1) / pageSize;
            // 3. 截取当前页数据
            int startIndex = (currentPage - 1) * pageSize;
            int endIndex = Math.min(startIndex + pageSize, totalCount);
            List<Teacher> teacherList = allTeachers.subList(startIndex, endIndex);
            
            // 传递数据
            model.addAttribute("teacherList", teacherList);
            model.addAttribute("currentPage", currentPage);
            model.addAttribute("pageSize", pageSize);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("totalCount", totalCount);
        } catch (Exception e) {
            model.addAttribute("msg", "分页查询失败：" + e.getMessage());
        }
        return "teacher/showAllTeacher";
    }

    // 2. 按教师编号精准查询
    @RequestMapping("/queryTeacherByTno")
    public String queryTeacherByTno(Integer Tno, Model model) {
        try {
            Teacher teacher = teacherService.getTeacherByTno(Tno);
            List<Teacher> teacherList = new ArrayList<Teacher>();
            if (teacher != null) {
                teacherList.add(teacher);
                // 分页参数（单条数据）
                model.addAttribute("teacherList", teacherList);
                model.addAttribute("currentPage", 1);
                model.addAttribute("pageSize", 5);
                model.addAttribute("totalPages", 1);
                model.addAttribute("totalCount", 1);
                model.addAttribute("msg", "查询到教师编号为" + Tno + "的信息！");
            } else {
                model.addAttribute("msg", "未查询到教师编号为" + Tno + "的信息！");
                model.addAttribute("teacherList", new ArrayList<Object>());
            }
        } catch (Exception e) {
            model.addAttribute("msg", "精准查询失败：" + e.getMessage());
            model.addAttribute("teacherList", new ArrayList<Object>());
        }
        return "teacher/showAllTeacher";
    }

    // 替换原有toQuery方法（指向分页查询）
    @RequestMapping("/toQuery")
    public String toQueryTeacher(Model model) {
        // 跳转到分页查询的第一页
        return queryAllTeacher(1, 5, model);
    }
    
    @RequestMapping("/delete/{tno}")
    public String deleteTeacher(@PathVariable("tno") Integer tno, Model model) {
        try {
            // 1. 先校验该教师是否存在
            Teacher existingTeacher = teacherService.getTeacherByTno(tno);
            if (existingTeacher == null) {
                model.addAttribute("msg", "教师编号" + tno + "不存在，删除失败！");
                return "teacher/showAllTeacher"; // 返回到查询页面并提示
            }

            // 2. 执行删除操作
            teacherService.deleteTeacherByTno(tno);
            model.addAttribute("msg", "教师编号" + tno + "删除成功！");
            
            // 3. 删除后重定向到分页查询页面（避免刷新重复提交）
            return "redirect:/teacher/queryAllTeacher";
        } catch (Exception e) {
            model.addAttribute("msg", "删除失败：" + e.getMessage());
            return "teacher/showAllTeacher";
        }
    }

}