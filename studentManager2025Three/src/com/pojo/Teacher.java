package com.pojo;

// 严格对应数据库teacher表结构
public class Teacher {
    private Integer Tno;    // 教师编号（主键，手动输入，非自增）
    private String Tname;   // 教师姓名（非空）
    private Integer Tage;   // 教师年龄（允许为空）
    private Integer Cno;    // 授课课程编号（关联课程表Cno）

    // 无参构造
    public Teacher() {}

    // 有参构造（适配新增操作）
    public Teacher(Integer Tno, String Tname, Integer Tage, Integer Cno) {
        this.Tno = Tno;
        this.Tname = Tname;
        this.Tage = Tage;
        this.Cno = Cno;
    }

    // Getter & Setter（属性名和数据库字段名一致，方便MyBatis自动映射）
    public Integer getTno() {
        return Tno;
    }
    public void setTno(Integer Tno) {
        this.Tno = Tno;
    }
    public String getTname() {
        return Tname;
    }
    public void setTname(String Tname) {
        this.Tname = Tname;
    }
    public Integer getTage() {
        return Tage;
    }
    public void setTage(Integer Tage) {
        this.Tage = Tage;
    }
    public Integer getCno() {
        return Cno;
    }
    public void setCno(Integer Cno) {
        this.Cno = Cno;
    }
}