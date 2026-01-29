package com.service;

import com.pojo.Course;
import java.util.List;

public interface CourseService {
    // 新增课程
    int addCourse(Course course);

    // 删除课程
    int deleteCourseByCno(Integer Cno);

    // 修改课程学分
    int updateCourseCredit(Integer Cno, Integer newCredit);

    // 按编号查询课程
    Course getCourseByCno(Integer Cno);

    // 查询所有课程
    List<Course> getAllCourse();
    
    // 分页查询课程
    List<Course> getCourseByPage(int pageNo, int pageSize);
    
    // 统计课程总数
    int countAllCourse();
    
    // 计算总页数（改为普通接口方法）
    int getTotalPages(int pageSize);
}