package com.dao;

import com.pojo.Sc;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface ScDao {
    // 1. 学生选课（新增sc记录，实体类已包含Cname和Tname）
    int addSc(Sc sc);

    // 2. 学生退课（删除sc记录）
    int deleteSc(@Param("sno") Integer sno, @Param("cno") Integer cno);

    // 3. 查看学生已选课程（根据sno查询sc关联的课程信息）
    List<com.pojo.Course> getSelectedCoursesBySno(Integer sno);

    // 4. 选课统计：查询所有sc记录的数量
    int countAllSc();
    
    // 按学生学号统计选课数
    int countScBySno(Integer sno);
    
    // 新增：统计课程总数（根据业务逻辑，通常是查询course表的总数）
    int countAllCourse();

}