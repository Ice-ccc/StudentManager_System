package com.service;

import com.dao.CourseDao;
import com.pojo.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements CourseService {

    // 注入Dao层对象
    @Autowired
    private CourseDao courseDao;

    @Override
    public int addCourse(Course course) {
        return courseDao.addCourse(course);
    }

    @Override
    public int deleteCourseByCno(Integer Cno) {
        return courseDao.deleteCourseByCno(Cno);
    }

    @Override
    public int updateCourseCredit(Integer Cno, Integer newCredit) {
        return courseDao.updateCourseCredit(Cno, newCredit);
    }

    @Override
    public Course getCourseByCno(Integer Cno) {
        return courseDao.getCourseByCno(Cno);
    }

    @Override
    public List<Course> getAllCourse() {
        return courseDao.getAllCourse();
    }
    
    @Override
    public List<Course> getCourseByPage(int pageNo, int pageSize) {
        int offset = (pageNo - 1) * pageSize;
        return courseDao.getCourseByPage(offset, pageSize);
    }

    @Override
    public int countAllCourse() {
        return courseDao.countAllCourse();
    }

    // 实现计算总页数的方法
    @Override
    public int getTotalPages(int pageSize) {
        int totalCount = countAllCourse();
        return (totalCount + pageSize - 1) / pageSize;
    }
}