<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>删除公告</title>
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
    width: 500px;
    margin: 0 auto;
    margin-top: 10%;
    <%-- ✅ 毛玻璃紫色些许透明 与往期完全一致 --%>
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
    width: 350px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 6px;
    background-color: rgba(255,255,255,0.8);
}
.buttons {
    text-align: center;
    margin-top: 20px;
}
input[type="submit"], input[type="button"] {
    width: 120px;
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
/* 错误提示样式 */
.errorMsg {
    color: red;
    text-align: center;
    margin-top: 10px;
    font-size: 16px;
    padding: 8px;
    border-radius: 6px;
    background-color: rgba(248,215,218,0.8);
}
/* 成功提示样式（和失败提示风格一致） */
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
        <h2>删除公告</h2>
        <%-- ✅ 表单提交路径、跳转方法 完全保留原始代码，一字未改 --%>
        <form action="${pageContext.request.contextPath}/notice/deleteNotice" method="post">
            <label>公告ID：</label>
            <input type="text" name="NidStr" required placeholder="请输入要删除的公告ID"/><br>
            
            <!-- 显示失败提示 -->
            <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
            <% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
                <div class="errorMsg"><%= errorMsg %></div>
            <% } %>

            <!-- 显示成功提示 -->
            <% String successMsg = (String) request.getAttribute("successMsg"); %>
            <% if (successMsg != null && !successMsg.trim().isEmpty()) { %>
                <div class="successMsg"><%= successMsg %></div>
            <% } %>
            
            <div class="buttons">
                <input type="submit" value="确认删除"/>
                <input type="button" value="返回公告总览" onclick="location.href='${pageContext.request.contextPath}/notice/toNoticeMain'"/>
            </div>
        </form>
    </div>
</body>
</html>