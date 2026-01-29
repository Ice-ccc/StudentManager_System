package com.service;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.StudentDao;
import com.pojo.Student;
@Service
@Transactional
//@Service用来表示业务层的实现类
//@Transactional该注解表示类中的所有方法（其实只需要增删改方法即可，查询方法不需要使用该注解）都纳入spring框架的事务管理
public class StudentServiceImpl  implements  StudentService{
	
	//@Autowired注解将StudentDao注入到本类中
	@Autowired
	StudentDao dao ;

	@Override
	public int register(Student s) {
		return dao.addStudent(s);
	}

	@Override
	public Student login(int sno, String pwd) {
		
		Map<String,Object> data  = new HashMap<String,Object>();
		data.put("sno", sno);
		data.put("pwd", pwd);
		
		return dao.getStudent(data);
		
	}
	
    @Override
    public int modifyPassword(int sno, String newPwd) {
        // 1. 先通过学号查询学生是否存在（避免更新不存在的记录）
        Student student = dao.getStudentBySno(sno);
        if (student == null) {
            return 0; // 学号不存在，返回0（修改失败）
        }

        // 2. 若学生存在，设置新密码，调用Dao更新数据库
        student.setPwd(newPwd);
        return dao.updateStudent(student); // Dao层通过MyBatis执行更新SQL
    }

	@Override
	public List<Student> getAllStudents() {
		
		return dao.getAllStudents();
		
	}

	@Override
	public int deleteStudentBySno(Integer sno) {
		
		
		return dao.deleteStudentBySno(sno);
	}



	@Override
	public int updateStudent(Student s) {
		return dao.updateStudent(s);
	}

	@Override
	public List<Student> getStudentsByName(String sname) {
		return dao.getStudentsByName(sname);
	}

	@Override
	public List<Student> getAllStudentsFenye(int pageNo, int pageSize) {
	    Map<String, Object> data = new HashMap<String, Object>(); // 明确泛型类型
	    // 页号校验
	    if (pageNo < 1) pageNo = 1;
	    int totalCount = dao.countAllStudents();
	    int totalPages = getTotalPages(pageSize);
	    if (pageNo > totalPages && totalPages > 0) pageNo = totalPages;
	    // 计算分页起始位置
	    int startPos = (pageNo - 1) * pageSize;
	    data.put("startPos", startPos);
	    data.put("pageSize", pageSize);
	    // 查询当前页数据
	    return dao.getAllStudentsFenye(data);
	}

	@Override
	public int countAllStudents() {
		return dao.countAllStudents();
	}

	@Override
	public int getTotalPages(int pageSize) {
		int totalCount = dao.countAllStudents();
		return totalCount == 0 ? 1 : (int) Math.ceil((double) totalCount / pageSize);
	}

	@Override
	public Student getStudentBySno(int sno) {
	    // 调用Dao层方法，通过MyBatis查询数据库
	    return dao.getStudentBySno(sno);
	}
	
	@Override
	public List<Student> getStudentsBySnameLike(String sname) {
	    return dao.selectBySnameLike("%" + sname + "%");
	}
	
	@Override
	public List<Student> getMaleGender(String gender){
		return dao.selectByGender(gender);
	}
	@Override
	public List<Student> getFemaleGender(String gender){
		return dao.selectByGender(gender);
	}
	
	
	@Override
	public List<Student>getFormalage(String age){
		return dao.selectFormalage();
	}
	
	@Override
	public List<Student>getMiddleage(String age){
		return dao.selectMiddleStudent();
	}

	@Override
	public List<Student>getHighage(String age){
		return dao.selectHighStudent();
	}
}