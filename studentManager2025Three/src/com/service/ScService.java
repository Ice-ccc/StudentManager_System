package com.service;

import com.pojo.Course;
import com.pojo.Sc;
import java.util.List;

public interface ScService {
    // 1. 学生选课
    int addSc(Sc sc);

    // 2. 学生退课
    int deleteSc(Integer sno, Integer cno);

    // 3. 查看学生已选课程
    List<Course> getSelectedCoursesBySno(Integer sno);

    // 4. 选课统计：获取总选课数
    int countAllSc();
    
    // 新增：按学生学号统计选课数（补全接口定义）
    int countScBySno(Integer sno);
    
    // 新增：统计所有课程总数
    int countAllCourse(); 
}