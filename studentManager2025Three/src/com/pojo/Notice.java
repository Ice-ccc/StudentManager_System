package com.pojo;

import java.util.Date;

public class Notice {
    private Integer Nid;        // 公告ID（手动输入）
    private String Ntitle;      // 公告标题
    private String Ncontent;    // 公告内容
    private Date Ntime;         // 发布时间
    private String Nauthor;     // 发布人

    // 无参构造
    public Notice() {}

    // 带参构造（包含Nid，手动输入）
    public Notice(Integer nid, String ntitle, String ncontent, String nauthor) {
        Nid = nid;
        Ntitle = ntitle;
        Ncontent = ncontent;
        Nauthor = nauthor;
    }

    // Getter + Setter
    public Integer getNid() { return Nid; }
    public void setNid(Integer nid) { Nid = nid; }
    public String getNtitle() { return Ntitle; }
    public void setNtitle(String ntitle) { Ntitle = ntitle; }
    public String getNcontent() { return Ncontent; }
    public void setNcontent(String ncontent) { Ncontent = ncontent; }
    public Date getNtime() { return Ntime; }
    public void setNtime(Date ntime) { Ntime = ntime; }
    public String getNauthor() { return Nauthor; }
    public void setNauthor(String nauthor) { Nauthor = nauthor; }
}