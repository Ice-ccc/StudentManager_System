package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pojo.Student;
import org.apache.ibatis.annotations.Param; 

public interface StudentDao {

	
	public   int  addStudent(Student s);
	
	public   int  deleteStudentBySno(Integer sno);
	
	
	public Student getStudent(Map map);
	
	public Student getStudentBySno(int sno);
	
	public    List<Student>   getAllStudents();
	
	public    List<Student>   getStudentsByName(String sname);
	
	
	public   List getAllStudentsFenye(Map map);
	
	public   int  updateStudent(Student s);
	
	public int countAllStudents();
	
	List<Student> selectBySnameLike(@Param("sname") String sname);
	
	List<Student>selectByGender(@Param("gender")String gender);
	
	List<Student> selectFormalage(); // 对应XML的selectFormalage
    List<Student> selectMiddleStudent(); // 对应XML的selectMiddleStudent
    List<Student> selectHighStudent(); // 对应XML的selectHighStudent
	
}