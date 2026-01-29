package com.service;

import com.dao.ScDao;
import com.pojo.Course;
import com.pojo.Sc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ScServiceImpl implements ScService {

    @Autowired
    private ScDao scDao;  // 注入ScDao

    // 1. 学生选课
    @Override
    public int addSc(Sc sc) {
        return scDao.addSc(sc);
    }

    // 2. 学生退课
    @Override
    public int deleteSc(Integer sno, Integer cno) {
        return scDao.deleteSc(sno, cno);
    }

    // 3. 查看学生已选课程
    @Override
    public List<Course> getSelectedCoursesBySno(Integer sno) {
        return scDao.getSelectedCoursesBySno(sno);
    }

    // 4. 选课统计：获取总选课数
    @Override
    public int countAllSc() {
        return scDao.countAllSc();
    }
    
    // 按学生学号统计选课数（实现接口方法）
    @Override
    public int countScBySno(Integer sno) {
        return scDao.countScBySno(sno);
    }
    
    @Override
    public int countAllCourse() {
        // 调用ScDao中对应的查询方法（需确保ScDao已定义该方法）
        return scDao.countAllCourse();
    }
}