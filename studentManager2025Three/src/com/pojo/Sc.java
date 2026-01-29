package com.pojo;

public class Sc {
    private Integer sno;       // 学生学号
    private Integer cno;       // 课程编号
    private String cname;      // 课程名称（仅保留这个字段，删除tname）

    // 无参构造
    public Sc() {}

    // 带sno、cno、cname的构造（选课用）
    public Sc(Integer sno, Integer cno, String cname) {
        this.sno = sno;
        this.cno = cno;
        this.cname = cname;
    }

    // 原有sno+cno构造（保留，兼容其他功能）
    public Sc(Integer sno, Integer cno) {
        this.sno = sno;
        this.cno = cno;
    }

    // getter和setter方法
    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}