package com.service;

import com.dao.NoticeDao;
import com.pojo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public int addNotice(Notice notice) {
        return noticeDao.addNotice(notice);
    }

    @Override
    public int deleteNoticeByNid(Integer Nid) {
        return noticeDao.deleteNoticeByNid(Nid);
    }

    @Override
    public int updateNoticeContent(Integer Nid, String newTitle, String newContent) {
        return noticeDao.updateNoticeContent(Nid, newTitle, newContent);
    }

    @Override
    public List<Notice> fuzzyQueryNotice(String keyword) {
        return noticeDao.fuzzyQueryNotice(keyword);
    }

    @Override
    public List<Notice> getAllNotice() {
        return noticeDao.getAllNotice();
    }

    @Override
    public Notice getNoticeByNid(Integer Nid) {
        return noticeDao.getNoticeByNid(Nid);
    }

    @Override
    public int checkNoticeIdExists(Integer Nid) {
        return noticeDao.checkNoticeIdExists(Nid);
    }
}