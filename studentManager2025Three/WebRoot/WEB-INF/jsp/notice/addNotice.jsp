<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加公告</title>
<style type="text/css">
body {
    <%-- ✅ 规范路径：访问项目根目录img，100%生效，符合JavaWeb规则 --%>
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
    background-color: rgba(255, 255, 255, 0.4); /* 毛玻璃紫色些许透明 原样保留 */
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
    font-size: 16px;
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
    box-shadow: 0 5px 12px rgba(128,0,128,0.2);
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
</style>
</head>
<body>
    <div class="container">
        <h2>添加公告</h2>
        <form action="${pageContext.request.contextPath}/notice/addNotice" method="post">
            <label>公告ID：</label>
            <input type="text" name="NidStr" value="<%= request.getAttribute("NidStr") != null ? request.getAttribute("NidStr") : "" %>" 
                   required placeholder="请输入手动设置的公告ID（数字）"/><br>
            
            <label>公告标题：</label>
            <input type="text" name="Ntitle" required placeholder="请输入公告标题"/><br>
            
            <label>公告内容：</label>
            <textarea name="Ncontent" required placeholder="请输入公告内容"></textarea><br>
            
            <label>发布人：</label>
            <input type="text" name="Nauthor" required placeholder="请输入发布人姓名"/><br>
            
            <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
            <% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
                <div class="errorMsg"><%= errorMsg %></div>
            <% } %>
            
            <div class="buttons">
                <input type="submit" value="提交添加"/>
                <input type="button" value="返回公告总览" onclick="location.href='${pageContext.request.contextPath}/notice/toNoticeMain'"/>
            </div>
        </form>
    </div>
</body>
</html>