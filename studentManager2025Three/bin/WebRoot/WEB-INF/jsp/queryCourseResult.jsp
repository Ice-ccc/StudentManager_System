<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.pojo.Course" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>课程查询结果</title>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
/* ✅ 全局背景 - 与项目所有页面统一，必显不跑偏 */
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
/* ✅ 核心容器 - 必加紫色边框 + 毛玻璃质感 + 统一圆角阴影，匹配全套规范 */
.container {
    width: 620px;
    margin: 0 auto;
    margin-top: 6%;
    background-color: rgba(255, 255, 255, 0.45);
    padding: 40px 30px;
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border: 2px solid #800080; /* ✅ 核心要求：2px深紫色主边框，醒目统一 */
}
/* ✅ 标题样式 - 深紫配色+下划线，与所有页面标题风格一致 */
h2 {
    color: #800080;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 35px;
    padding-bottom: 15px;
    border-bottom: 2px solid #800080;
}
/* ✅ 信息项样式 - 美化排版+配色，强化阅读体验，适配统一风格 */
.info-item {
    margin: 20px 0;
    padding: 12px 8px;
    border-bottom: 1px dashed #d8c0d8; /* 浅紫虚线，呼应主色系 */
    font-size: 18px;
}
/* ✅ 标签样式 - 深紫+楷体+加粗，和表单页标签统一 */
.label {
    display: inline-block;
    width: 120px;
    font-weight: bold;
    color: #800080;
    font-size: 18px;
}
/* ✅ 按钮容器 - 间距优化，适配多按钮排版更协调 */
.button-group {
    text-align: center;
    margin-top: 40px;
}
/* ✅ 按钮统一 - 紫框透明底+hover填充特效，与所有页面按钮一致 */
.back-button {
    display: inline-block;
    width: 125px;
    height: 48px;
    line-height: 48px;
    margin: 0 8px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    border-radius: 6px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    transition: all 0.35s ease;
}
/* ✅ 按钮hover特效 - 紫底白字+悬浮阴影，全套统一交互 */
.back-button:hover {
    background-color: #800080;
    color: #ffffff;
    text-decoration: none;
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}
</style>
</head>
<body>
    <%
        Course course = (Course) session.getAttribute("queryCourse");
        if (course == null) {
            response.sendRedirect("toQueryCourse");
            return;
        }
    %>
    <div class="container">
        <h2>课程查询结果</h2>
        
        <div class="info-item">
            <span class="label">课程编号：</span>
            <%= course.getCno() %>
        </div>
        
        <div class="info-item">
            <span class="label">课程名称：</span>
            <%= course.getCname() %>
        </div>
        
        <div class="info-item">
            <span class="label">课程学分：</span>
            <%= course.getCredit() %>
        </div>
        
        <div class="info-item">
            <span class="label">课程备注：</span>
            <%= course.getComment() != null ? course.getComment() : "无" %>
        </div>
        
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/toQueryCourse" class="back-button">返回查询</a>
            <a href="${pageContext.request.contextPath}/toMain" class="back-button">返回首页</a>
            <a href="${pageContext.request.contextPath}/queryAllCourse" class="back-button">查看所有课程</a>
        </div>
    </div>
</body>
</html>