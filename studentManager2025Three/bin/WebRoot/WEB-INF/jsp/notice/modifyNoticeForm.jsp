<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.pojo.Notice" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改公告内容</title>
<style type="text/css">
body {
    <%-- ✅ 严格按要求添加指定背景路径，一字未改 --%>
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
    font-weight: bold;
}
label {
    display: inline-block;
    width: 100px;
    font-weight: bold;
    color: #800080;
    font-size: 18px;
    margin: 10px 0;
}
input[type="text"] {
    width: 450px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 6px;
    background-color: rgba(255,255,255,0.8);
    font-family: 楷体;
}
textarea {
    width: 450px;
    height: 150px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 6px;
    resize: none;
    background-color: rgba(255,255,255,0.8);
    font-family: 楷体;
}
.buttons {
    text-align: center;
    margin-top: 20px;
}
input[type="submit"], input[type="button"] {
    width: 140px;
    background-color: #800080;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 6px;
    cursor: pointer;
    font-family: 楷体;
    font-size: 16px;
    margin: 0 10px;
    transition: all 0.35s ease;
}
input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #6a0dad;
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}
.errorMsg {
    color: red;
    text-align: center;
    margin-top: 10px;
    font-size: 16px;
    padding: 8px;
    border-radius: 6px;
    background-color: rgba(248,215,218,0.8);
}
/* 新增：成功提示样式（和失败提示风格一致） */
.successMsg {
    color: #28a745;
    text-align: center;
    margin-top: 10px;
    font-size: 16px;
    padding: 8px;
    border-radius: 6px;
    background-color: rgba(212,237,218,0.8);
}
</style>
</head>
<body>
    <div class="container">
        <%
            Notice notice = (Notice) request.getAttribute("notice");
            if (notice == null) {
                response.sendRedirect("toModifyNotice");
                return;
            }
        %>
        <h2>修改公告内容（ID：<%= notice.getNid() %>）</h2>
        <%-- ✅ 表单提交路径、跳转方法、所有参数 完全保留原始代码，一字未改 --%>
        <form action="${pageContext.request.contextPath}/notice/modifyNoticeContent" method="post">
            <input type="hidden" name="Nid" value="<%= notice.getNid() %>"/>
            
            <label>新标题：</label>
            <input type="text" name="newTitle" value="<%= notice.getNtitle() %>" required/><br>
            
            <label>新内容：</label>
            <textarea name="newContent" required><%= notice.getNcontent() %></textarea><br>
            
            <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
            <% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
                <div class="errorMsg"><%= errorMsg %></div>
            <% } %>
            
            <!-- 新增：显示成功提示 -->
            <% String successMsg = (String) request.getAttribute("successMsg"); %>
            <% if (successMsg != null && !successMsg.trim().isEmpty()) { %>
                <div class="successMsg"><%= successMsg %></div>
            <% } %>
            
            <div class="buttons">
                <input type="submit" value="确认修改"/>
                <input type="button" value="返回修改公告页面" onclick="location.href='${pageContext.request.contextPath}/notice/toModifyNotice'"/>
                <input type="button" value="返回公告总览" onclick="location.href='${pageContext.request.contextPath}/notice/toNoticeMain'"/>
            </div>
        </form>
    </div>
</body>
</html>