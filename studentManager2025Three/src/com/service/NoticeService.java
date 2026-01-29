package com.service;

import com.pojo.Notice;
import java.util.List;

public interface NoticeService {
    // 新增公告（手动输入ID）
    int addNotice(Notice notice);

    // 删除公告
    int deleteNoticeByNid(Integer Nid);

    // 修改公告内容
    int updateNoticeContent(Integer Nid, String newTitle, String newContent);

    // 模糊查询公告
    List<Notice> fuzzyQueryNotice(String keyword);

    // 查询所有公告
    List<Notice> getAllNotice();

    // 根据ID查询公告
    Notice getNoticeByNid(Integer Nid);

    // 校验公告ID是否存在
    int checkNoticeIdExists(Integer Nid);
    
}