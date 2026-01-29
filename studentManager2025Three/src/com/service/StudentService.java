package com.service;

import java.util.ArrayList;
import java.util.List;

import com.pojo.Student;

public interface StudentService {
	
	
	public   int  register(Student s);
	
	
	public   int  deleteStudentBySno(Integer sno);
	
	public Student login(int sno,String pwd);
	
	public    List<Student>   getAllStudents();
	
    public List<Student> getAllStudentsFenye(int pageNo, int pageSize);
	
	public    List<Student>   getStudentsByName(String sname);
	
	
	public   int  updateStudent(Student s);
	
	public int modifyPassword(int sno, String newPwd);
	
	public Student getStudentBySno(int sno);
	
	// 新增：查询总记录数
	public int countAllStudents();
	
    public int getTotalPages(int pageSize);
    
    List<Student> getStudentsBySnameLike(String sname);
    
    public List<Student> getMaleGender(String gender);//查询男性别方法
    public List<Student> getFemaleGender(String gender);//查询女性别方法
   
    
    public int getStudentage(Integer age);
    public List<Student>getFormalage(String age);
    public List<Student>getHighage(String age);
    public List<Student>getMiddleage(String age);
}