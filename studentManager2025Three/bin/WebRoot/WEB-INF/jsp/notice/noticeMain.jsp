<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.pojo.Notice,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>公告总览</title>
<style type="text/css">
/* 页面基础样式，模拟移动端风格 */
body {
    margin: 0;
    padding: 0;
    font-family: "微软雅黑", sans-serif;
    background-color: #f5f5f5;
    min-height: 100vh;
    padding-bottom: 80px; /* 给底部悬浮框留空间 */
}

/* 顶部导航栏（模拟图片顶部栏） */
.top-bar {
    background-color: #fff;
    padding: 12px 16px;
    border-bottom: 1px solid #eee;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: sticky;
    top: 0;
    z-index: 10;
}
.top-bar h1 {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin: 0;
}
.top-bar .search-btn {
    color: #666;
    text-decoration: none;
    font-size: 16px;
}

/* 公告列表容器 */
.notice-container {
    padding: 16px;
}
.notice-item {
    background-color: #fff;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 12px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}
.notice-title {
    font-size: 16px;
    font-weight: bold;
    color: #333;
    margin-bottom: 8px;
    display: flex;
    align-items: center;
}
.notice-title .id-tag {
    background-color: #e6f7ff;
    color: #1890ff;
    font-size: 12px;
    padding: 2px 6px;
    border-radius: 4px;
    margin-right: 8px;
}
.notice-info {
    font-size: 12px;
    color: #999;
    margin-bottom: 10px;
}
.notice-content {
    font-size: 14px;
    color: #666;
    line-height: 1.6;
}
.no-data {
    text-align: center;
    padding: 40px 0;
    color: #999;
    font-size: 14px;
}

/* 底部悬浮功能框 */
.float-btn-box {
    position: fixed;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    background-color: #fff;
    border-radius: 12px;
    padding: 12px 20px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    display: flex;
    gap: 24px;
    z-index: 9;
}
.float-btn {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-decoration: none;
    color: #333;
    font-size: 12px;
}
.float-btn .icon {
    width: 28px;
    height: 28px;
    background-color: #f0f2f5;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 4px;
    font-size: 16px;
}
.float-btn:hover .icon {
    background-color: #e6f7ff;
    color: #1890ff;
}
</style>
</head>
<body>
    <!-- 顶部导航栏 -->
    <div class="top-bar">
        <h1>公告总览</h1>
        <a href="${pageContext.request.contextPath}/notice/toFuzzyQueryNotice" class="search-btn">搜索</a>
    </div>

    <!-- 公告列表 -->
    <div class="notice-container">
        <%
            List<Notice> noticeList = (List<Notice>) request.getAttribute("noticeList");
            if (noticeList != null && !noticeList.isEmpty()) {
                for (Notice notice : noticeList) {
        %>
        <div class="notice-item">
            <div class="notice-title">
                <span class="id-tag">ID: <%= notice.getNid() %></span>
                <%= notice.getNtitle() %>
            </div>
            <div class="notice-info">
                发布人：<%= notice.getNauthor() %> | 发布时间：<%= notice.getNtime() %>
            </div>
            <div class="notice-content">
                <%= notice.getNcontent() %>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <div class="no-data">暂无公告信息</div>
        <%
            }
        %>
    </div>

    <!-- 底部悬浮功能框 -->
    <div class="float-btn-box">
        <a href="${pageContext.request.contextPath}/notice/toAddNotice" class="float-btn">
            <div class="icon">+</div>
            添加公告
        </a>
        <a href="${pageContext.request.contextPath}/notice/toDeleteNotice" class="float-btn">
            <div class="icon">×</div>
            删除公告
        </a>
        <a href="${pageContext.request.contextPath}/notice/toModifyNotice" class="float-btn">
            <div class="icon">✎</div>
            修改公告
        </a>
        <a href="${pageContext.request.contextPath}/notice/toFuzzyQueryNotice" class="float-btn">
            <div class="icon">🔍</div>
            模糊查询
        </a>
       <a href="${pageContext.request.contextPath}/toMain" class="float-btn">
           <div class="icon">🏠</div>
            返回首页
        </a>
    </div>
</body>
</html>