package com.dao;

import com.pojo.Course;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface CourseDao {
    // 1. 新增课程
    int addCourse(Course course);

    // 2. 删除课程（根据课程编号）
    int deleteCourseByCno(@Param("Cno") Integer Cno);

    // 3. 修改课程学分（根据课程编号）
    int updateCourseCredit(@Param("Cno") Integer Cno, @Param("newCredit") Integer newCredit);

    // 4. 按课程编号查询课程
    Course getCourseByCno(@Param("Cno") Integer Cno);

    // 5. 查询所有课程
    List<Course> getAllCourse();
    
    // 新增：分页查询课程
    List<Course> getCourseByPage(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize);
    
    // 新增：统计课程总数
    int countAllCourse();
}