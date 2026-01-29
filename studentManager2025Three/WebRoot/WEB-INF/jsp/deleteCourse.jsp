<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>删除课程</title>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
/* ✅ 全局背景 - 与所有页面1:1统一，必显不跑偏 */
body {
    min-height: 100vh;
    margin: 0;
    padding: 0;
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
}
/* ✅ 核心容器 - 紫色边框+毛玻璃+统一圆角阴影，匹配项目规范 */
.container {
    width: 500px;
    margin: 0 auto;
    margin-top: 8%;
    background-color: rgba(255, 255, 255, 0.45);
    padding: 35px 25px;
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border: 2px solid #800080; /* ✅ 必加：2px深紫色主边框，醒目统一 */
}
/* ✅ 标题样式 - 深紫配色+下划线，和所有页面标题一致 */
h2 {
    color: #800080;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 30px;
    padding-bottom: 12px;
    border-bottom: 2px solid #800080;
}
/* ✅ 表单标签 - 深紫+楷体+排版优化，强化阅读体验 */
span {
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-weight: bolder;
    color: #800080;
    font-size: 18px;
    display: inline-block;
    width: 120px;
}
/* ✅ 输入框 - 圆角优化+间距调整，适配统一风格 */
input {
    margin-bottom: 20px;
    padding: 10px 8px;
    width: 300px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-size: 16px;
}
/* ✅ 按钮容器 - 间距优化，居中对齐 */
.buttons {
    margin-top: 25px;
    text-align: center;
}
/* ✅ 按钮统一 - 紫框透明底+hover填充特效，和提示/成功页按钮一致 */
input[type="submit"], input[type="button"] {
    width: 120px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    padding: 10px;
    border-radius: 6px;
    cursor: pointer;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-size: 16px;
    font-weight: bold;
    transition: all 0.35s ease;
}
/* ✅ 按钮hover特效 - 紫底白字+阴影，全套统一交互 */
input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #800080;
    color: #ffffff;
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}
/* ✅ 成功提示 - 绿色醒目，适配楷体+字号优化 */
.successMsg {
    color: #28a745;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 5px;
    font-size: 18px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-weight: 500;
}
/* ✅ 错误提示 - 深紫配色（统一项目色系），醒目且协调 */
.errorMsg {
    color: #800080;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 5px;
    font-size: 18px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-weight: 500;
}
</style>
</head>
<body>
    <div class="container">
        <h2>删除课程信息</h2>
        <form action="deleteCourse" method="post">
            <span>课程编号：</span>
            <input type="text" name="CnoStr" required placeholder="请输入要删除的课程编号"/><br>
            
            <%-- 显示删除成功提示 --%>
            <% String success = request.getParameter("success"); %>
            <% if ("true".equals(success)) { %>
                <div class="successMsg">删除成功！</div>
            <% } %>
            
            <%-- 显示错误提示 --%>
            <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
            <% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
                <div class="errorMsg"><%= errorMsg %></div>
            <% } %>
            
            <div class="buttons">
                <input type="submit" value="删除课程"/>
                <input type="button" value="返回首页" onclick="location.href='${pageContext.request.contextPath}/toMain'" style="margin-left: 20px;"/>
            </div>
        </form>
    </div>
</body>
</html>