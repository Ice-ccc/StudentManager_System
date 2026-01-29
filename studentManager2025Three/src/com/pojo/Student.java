package com.pojo;

public class Student {


	private Integer sno;
	private String sname;
	private String pwd;
	private Integer age;
	private String hobbit; 
	private String address;
	private String gender;
	//新添加性别类
	
	
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
    public String getHobbit() {
        return hobbit;
    }
    public void setHobbit(String hobbit) {
        this.hobbit = hobbit;
    }
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender=gender;
	}
	//新添加性别类
	public Student(){
		
	}
	public Student(Integer sno, String sname, String pwd, Integer age,String hobbit,
			String address,String gender) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.pwd = pwd;
		this.age = age;
		this.hobbit = hobbit;
		this.address = address;
		this.gender= gender;
	}
	//新添加性别类更改代码
    
}