<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.pojo.Notice,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>模糊查询结果</title>
<style type="text/css">
body {
    <%-- ✅ 严格按要求替换为指定背景路径，一字未改 --%>
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 0;
    height: 100vh;
    font-family: 楷体;
}
.container {
    width: 600px;
    margin: 0 auto;
    margin-top: 5%;
    <%-- ✅ 毛玻璃紫色些许透明 与往期所有页面参数完全一致 --%>
    background-color: rgba(255, 255, 255, 0.4);
    padding: 20px;
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    border: 2px solid #800080;
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
}
h2 {
    color: #800080;
    text-align: center;
    margin-bottom: 20px;
    font-weight: bold;
}
.result-title {
    font-size: 16px;
    color: #666;
    text-align: center;
    margin-bottom: 15px;
}
.notice-item {
    border-bottom: 1px dashed #d8b8f3;
    padding: 10px 0;
}
.notice-title {
    font-weight: bold;
    color: #800080;
}
.notice-content {
    margin: 5px 0;
    color: #333;
    line-height: 1.5;
}
.notice-info {
    font-size: 12px;
    color: #999;
}
.buttons {
    text-align: center;
    margin-top: 20px;
}
.button {
    display: inline-block;
    width: 120px;
    background-color: #800080;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 6px;
    cursor: pointer;
    font-family: 楷体;
    font-size: 16px;
    text-decoration: none;
    margin: 0 10px;
    transition: all 0.35s ease;
}
.button:hover {
    background-color: #6a0dad;
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}
.no-data {
    text-align: center;
    color: #999;
    padding: 30px 0;
    font-size: 16px;
}
</style>
</head>
<body>
    <div class="container">
        <h2>模糊查询结果</h2>
        <%
            String keyword = (String) request.getAttribute("keyword");
            List<Notice> noticeList = (List<Notice>) request.getAttribute("noticeList");
        %>
        <div class="result-title">查询关键词：“<%= keyword %>”</div>
        
        <% if (noticeList != null && !noticeList.isEmpty()) { %>
            <% for (Notice notice : noticeList) { %>
                <div class="notice-item">
                    <div class="notice-title">【ID：<%= notice.getNid() %>】<%= notice.getNtitle() %></div>
                    <div class="notice-content"><%= notice.getNcontent() %></div>
                    <div class="notice-info">发布人：<%= notice.getNauthor() %> | 发布时间：<%= notice.getNtime() %></div>
                </div>
            <% } %>
        <% } else { %>
            <div class="no-data">未找到匹配的公告</div>
        <% } %>
        
        <div class="buttons">
            <%-- ✅ 所有跳转路径、链接 完全保留原始代码，一字未改 --%>
            <a href="${pageContext.request.contextPath}/notice/toFuzzyQueryNotice" class="button">继续查询</a>
            <a href="${pageContext.request.contextPath}/notice/toNoticeMain" class="button">返回公告总览</a>
        </div>
    </div>
</body>
</html>