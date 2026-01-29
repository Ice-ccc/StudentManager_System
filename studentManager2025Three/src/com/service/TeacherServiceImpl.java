package com.service;

import com.dao.TeacherDao;
import com.pojo.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

    @Override
    public void addTeacher(Teacher teacher) {
        int result = teacherDao.addTeacher(teacher);
        if (result <= 0) {
            throw new RuntimeException("新增教师失败，请检查教师编号是否重复");
        }
    }

    @Override
    public Teacher getTeacherByTno(Integer Tno) {
        return teacherDao.getTeacherByTno(Tno);
    }

    @Override
    public List<Teacher> getAllTeachers() {
        return teacherDao.getAllTeachers();
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        int result = teacherDao.updateTeacher(teacher);
        if (result <= 0) {
            throw new RuntimeException("修改教师信息失败，教师编号不存在");
        }
    }

    @Override
    public void deleteTeacher(Integer Tno) {
        int result = teacherDao.deleteTeacher(Tno);
        if (result <= 0) {
            throw new RuntimeException("删除教师失败，教师编号不存在");
        }
    }

    @Override
    public List<Teacher> getTeachersByCnoNull() {
        return teacherDao.selectTeachersByCnoNull();
    }

    @Override
    public void updateTeacherCno(Integer Tno, Integer Cno) {
        int result = teacherDao.updateTeacherCno(Tno, Cno);
        if (result <= 0) {
            throw new RuntimeException("课程分配失败，请检查教师编号是否存在");
        }
    }
    @Override
    public void deleteTeacherByTno(Integer Tno) {
        // 复用原有删除逻辑，避免重复代码
        this.deleteTeacher(Tno);
    }
    
    
}