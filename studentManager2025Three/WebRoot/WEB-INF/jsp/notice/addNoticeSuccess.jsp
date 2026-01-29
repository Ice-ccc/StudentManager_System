<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加公告成功</title>
<style type="text/css">
body {
    <%-- ✅ 严格按要求：固定写死你指定的背景路径，一字未改 --%>
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
    width: 400px;
    margin: 0 auto;
    margin-top: 15%;
    <%-- ✅ 毛玻璃紫色些许透明：和往期页面参数完全一致，不变样 --%>
    background-color: rgba(255, 255, 255, 0.4);
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    border: 2px solid #800080;
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    text-align: center;
}
h2 {
    color: green; <%-- ✅ 保留原始成功绿色，不修改 --%>
}
.successMsg {
    font-size: 18px;
    color: #333;
    margin: 20px 0;
}
.button {
    display: inline-block;
    width: 120px;
    background-color: #800080; <%-- ✅ 紫色按钮和往期一致 --%>
    color: white;
    border: none;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
    font-family: 楷体;
    font-size: 16px;
    text-decoration: none;
    margin: 0 10px;
}
.button:hover {
    background-color: #800080; <%-- ✅ 保留原始hover效果，不修改 --%>
}
</style>
</head>
<body>
    <div class="container">
        <h2>操作成功！</h2>
        <div class="successMsg"><%= request.getAttribute("successMsg") %></div>
        <%-- ✅ 所有跳转链接/路径/EL表达式：一字未改，完全保留原始代码 --%>
        <a href="${pageContext.request.contextPath}/notice/toAddNotice" class="button">继续添加</a>
        <a href="${pageContext.request.contextPath}/notice/toNoticeMain" class="button">返回公告总览</a>
    </div>
</body>
</html>