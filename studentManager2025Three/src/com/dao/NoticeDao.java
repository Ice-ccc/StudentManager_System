package com.dao;

import com.pojo.Notice;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface NoticeDao {
    // 新增公告（手动输入ID）
    int addNotice(Notice notice);

    // 根据公告ID删除公告
    int deleteNoticeByNid(@Param("Nid") Integer Nid);

    // 修改公告内容（标题+内容）
    int updateNoticeContent(@Param("Nid") Integer Nid, @Param("newTitle") String newTitle, @Param("newContent") String newContent);

    // 模糊查询公告（按标题/内容）
    List<Notice> fuzzyQueryNotice(@Param("keyword") String keyword);

    // 查询所有公告
    List<Notice> getAllNotice();

    // 根据ID查询公告（用于修改/删除前校验）
    Notice getNoticeByNid(@Param("Nid") Integer Nid);

    // 新增：校验公告ID是否存在（避免重复添加）
    int checkNoticeIdExists(@Param("Nid") Integer Nid);
}