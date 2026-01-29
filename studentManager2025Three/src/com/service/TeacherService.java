package com.service;

import com.pojo.Teacher;
import java.util.List;

public interface TeacherService {
    // 新增教师
    void addTeacher(Teacher teacher);

    // 根据教师编号查询
    Teacher getTeacherByTno(Integer Tno);

    // 查询所有教师
    List<Teacher> getAllTeachers();

    // 修改教师信息
    void updateTeacher(Teacher teacher);

    // 根据教师编号删除
    void deleteTeacher(Integer Tno);
    
 // TeacherService接口新增
 // 1. 查询所有未分配课程的教师
    List<Teacher> getTeachersByCnoNull();
 // 2. 更新教师的课程编号（分配课程）
    void updateTeacherCno(Integer Tno, Integer Cno);
    
        // 根据编号删除教师
    
    void deleteTeacherByTno(Integer Tno);
}