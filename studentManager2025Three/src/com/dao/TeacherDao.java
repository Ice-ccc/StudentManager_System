package com.dao;

import com.pojo.Teacher;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface TeacherDao {
    // 新增教师（Tno手动输入，非自增）
    int addTeacher(Teacher teacher);

    // 根据教师编号查询
    Teacher getTeacherByTno(@Param("Tno") Integer Tno);

    // 查询所有教师
    List<Teacher> getAllTeachers();

    // 修改教师信息
    int updateTeacher(Teacher teacher);

    // 根据教师编号删除
    int deleteTeacher(@Param("Tno") Integer Tno);
    
    // 【新增】对应XML中selectTeachersByCnoNull的方法
    List<Teacher> selectTeachersByCnoNull();

    // 【新增】对应XML中updateTeacherCno的方法
    int updateTeacherCno(@Param("Tno") Integer Tno, @Param("Cno") Integer Cno);
}