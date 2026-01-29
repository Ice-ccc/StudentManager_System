package com.pojo;

public class Course {
    // 对应课程表4个字段
    private Integer Cno;       // 课程编号
    private String Cname;      // 课程名称
    private Integer Credit;    // 课程学分
    private String Comment;    // 课程备注

    // 无参构造器（Spring MVC和MyBatis必须）
    public Course() {}

    // 全参构造器
    public Course(Integer cno, String cname, Integer credit, String comment) {
        Cno = cno;
        Cname = cname;
        Credit = credit;
        Comment = comment;
    }

    // Getter和Setter方法（必须，用于属性赋值和取值）
    public Integer getCno() {
        return Cno;
    }

    public void setCno(Integer cno) {
        Cno = cno;
    }

    public String getCname() {
        return Cname;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public Integer getCredit() {
        return Credit;
    }

    public void setCredit(Integer credit) {
        Credit = credit;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String comment) {
        Comment = comment;
    }
}