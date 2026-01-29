package com.controller;

import com.pojo.Notice;
import com.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    // ------------------- 总公告页面（展示所有公告） -------------------
    @RequestMapping("/toNoticeMain")
    public String toNoticeMain(Model model) {
        List<Notice> noticeList = noticeService.getAllNotice();
        model.addAttribute("noticeList", noticeList);
        return "notice/noticeMain"; // 已加notice/前缀
    }

    // ------------------- 添加公告（手动输入ID） -------------------
    @RequestMapping("/toAddNotice")
    public String toAddNotice() {
        return "notice/addNotice"; // 已加notice/前缀
    }

    @RequestMapping("/addNotice")
    public String addNotice(
            @RequestParam("NidStr") String NidStr,
            @RequestParam("Ntitle") String Ntitle,
            @RequestParam("Ncontent") String Ncontent,
            @RequestParam("Nauthor") String Nauthor,
            Model model) {
        try {
            // 1. 校验ID格式
            Integer Nid = Integer.parseInt(NidStr);
            if (Nid <= 0) {
                model.addAttribute("errorMsg", "公告ID必须为正整数！");
                return "notice/addNotice"; // 修正：添加notice/前缀
            }

            // 2. 校验ID是否已存在
            int idCount = noticeService.checkNoticeIdExists(Nid);
            if (idCount > 0) {
                model.addAttribute("errorMsg", "公告ID " + Nid + " 已存在，请更换！");
                model.addAttribute("NidStr", NidStr); // 回显ID
                return "notice/addNotice"; // 修正：添加notice/前缀
            }

            // 3. 校验必填字段
            if (Ntitle.trim().isEmpty() || Ncontent.trim().isEmpty() || Nauthor.trim().isEmpty()) {
                model.addAttribute("errorMsg", "标题、内容、发布人均不能为空！");
                model.addAttribute("NidStr", NidStr); // 回显ID
                return "notice/addNotice"; // 修正：添加notice/前缀
            }

            // 4. 新增公告
            Notice notice = new Notice(Nid, Ntitle, Ncontent, Nauthor);
            int result = noticeService.addNotice(notice);
            if (result > 0) {
                model.addAttribute("successMsg", "公告添加成功！ID：" + Nid);
                return "notice/addNoticeSuccess"; // 已加notice/前缀
            } else {
                model.addAttribute("errorMsg", "公告添加失败，请重试！");
                model.addAttribute("NidStr", NidStr); // 回显ID
                return "notice/addNotice"; // 已加notice/前缀
            }
        } catch (NumberFormatException e) {
            model.addAttribute("errorMsg", "公告ID格式错误（请输入数字）！");
            return "notice/addNotice"; // 已加notice/前缀
        }
    }

    // ------------------- 删除公告 -------------------
    @RequestMapping("/toDeleteNotice")
    public String toDeleteNotice() {
        return "notice/deleteNotice"; // 已加notice/前缀
    }

    @RequestMapping("/deleteNotice")
    public String deleteNotice(@RequestParam("NidStr") String NidStr, Model model) {
        try {
            Integer Nid = Integer.parseInt(NidStr);
            // 校验公告是否存在
            Notice notice = noticeService.getNoticeByNid(Nid);
            if (notice == null) {
                model.addAttribute("errorMsg", "公告ID " + Nid + " 不存在！");
                return "notice/deleteNotice";
            }

            int result = noticeService.deleteNoticeByNid(Nid);
            if (result > 0) {
                // 关键修改：回显成功提示到删除页面
                model.addAttribute("successMsg", "公告ID " + Nid + " 删除成功！");
                return "notice/deleteNotice"; 
            } else {
                model.addAttribute("errorMsg", "公告删除失败，请重试！");
                return "notice/deleteNotice";
            }
        } catch (NumberFormatException e) {
            model.addAttribute("errorMsg", "公告ID格式错误（请输入数字）！");
            return "notice/deleteNotice";
        }
    }

    // ------------------- 模糊查询公告 -------------------
    @RequestMapping("/toFuzzyQueryNotice")
    public String toFuzzyQueryNotice() {
        return "notice/fuzzyQueryNotice"; // 修正：添加notice/前缀
    }

    @RequestMapping("/fuzzyQueryNotice")
    public String fuzzyQueryNotice(@RequestParam("keyword") String keyword, Model model) {
        if (keyword.trim().isEmpty()) {
            model.addAttribute("errorMsg", "查询关键词不能为空！");
            return "notice/fuzzyQueryNotice"; // 修正：添加notice/前缀
        }

        List<Notice> noticeList = noticeService.fuzzyQueryNotice(keyword);
        if (noticeList.isEmpty()) {
            model.addAttribute("errorMsg", "未找到包含“" + keyword + "”的公告！");
            return "notice/fuzzyQueryNotice"; // 修正：添加notice/前缀
        } else {
            model.addAttribute("noticeList", noticeList);
            model.addAttribute("keyword", keyword);
            return "notice/fuzzyQueryResult"; // 修正：添加notice/前缀
        }
    }
 // ------------------- 新增：按ID精准查询公告 -------------------
    @RequestMapping("/queryNoticeById")
    public String queryNoticeById(@RequestParam("NidStr") String NidStr, Model model) {
        try {
            // 1. 校验ID格式
            Integer Nid = Integer.parseInt(NidStr);
            
            // 2. 按ID查询公告
            Notice notice = noticeService.getNoticeByNid(Nid);
            if (notice != null) {
                // 3. 查询成功：跳转到结果页（复用fuzzyQueryResult.jsp）
            	List<Notice> noticeList = new ArrayList<Notice>();
                noticeList.add(notice);
                model.addAttribute("noticeList", noticeList);
                model.addAttribute("keyword", "ID:" + Nid);
                return "notice/fuzzyQueryResult";
            } else {
                // 4. ID不存在：回显错误到查询页
                model.addAttribute("errorMsg", "未找到ID为“" + Nid + "”的公告！");
                return "notice/fuzzyQueryNotice";
            }
        } catch (NumberFormatException e) {
            // 5. ID格式错误
            model.addAttribute("errorMsg", "公告ID格式错误，请输入数字！");
            return "notice/fuzzyQueryNotice";
        }
    }

 // ------------------- 修改公告内容 -------------------
    @RequestMapping("/toModifyNotice")
    public String toModifyNotice() {
        return "notice/modifyNotice"; // 修正：添加notice/前缀
    }

    @RequestMapping("/getNoticeForModify")
    public String getNoticeForModify(@RequestParam("NidStr") String NidStr, Model model) {
        try {
            Integer Nid = Integer.parseInt(NidStr);
            Notice notice = noticeService.getNoticeByNid(Nid);
            if (notice == null) {
                model.addAttribute("errorMsg", "公告ID " + Nid + " 不存在！");
                return "notice/modifyNotice"; // 修正：添加notice/前缀
            } else {
                model.addAttribute("notice", notice);
                return "notice/modifyNoticeForm"; // 修正：添加notice/前缀
            }
        } catch (NumberFormatException e) {
            model.addAttribute("errorMsg", "公告ID格式错误（请输入数字）！");
            return "notice/modifyNotice"; // 修正：添加notice/前缀
        }
    }

    @RequestMapping("/modifyNoticeContent")
    public String modifyNoticeContent(
            @RequestParam("Nid") Integer Nid,
            @RequestParam("newTitle") String newTitle,
            @RequestParam("newContent") String newContent,
            Model model) {
        if (newTitle.trim().isEmpty() || newContent.trim().isEmpty()) {
            model.addAttribute("errorMsg", "标题、内容不能为空！");
            model.addAttribute("notice", noticeService.getNoticeByNid(Nid));
            return "notice/modifyNoticeForm"; // 修正：添加notice/前缀
        }

        int result = noticeService.updateNoticeContent(Nid, newTitle, newContent);
        if (result > 0) {
            // 关键修改：回显成功提示到修改页面，不再跳转新页面
            model.addAttribute("successMsg", "公告ID " + Nid + " 内容修改成功！");
            // 重新查询最新的公告数据回显到页面
            model.addAttribute("notice", noticeService.getNoticeByNid(Nid));
            return "notice/modifyNoticeForm"; 
        } else {
            model.addAttribute("errorMsg", "公告修改失败，请重试！");
            model.addAttribute("notice", noticeService.getNoticeByNid(Nid));
            return "notice/modifyNoticeForm"; // 修正：添加notice/前缀
        }
    }
}