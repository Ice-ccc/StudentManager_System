<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.pojo.Student" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生信息查询结果</title>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-repeat: no-repeat; 
    background-size: cover; 
    background-position: center; 
    background-attachment: fixed;
    height: 100vh;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
}

/* ✅ 核心升级：添加2px深紫色主边框 + 强化毛玻璃质感 + 统一阴影 */
.container {
    width: 550px;
    background-color: rgba(255, 255, 255, 0.45);
    padding: 35px 40px;
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border: 2px solid #800080; /* ✅ 必加要求：醒目深紫色主边框，与全项目统一 */
}

/* ✅ 标题样式：深紫配色+居中+下划线，匹配项目所有页面规范 */
h2 {
    color: #800080;
    text-align: center;
    font-size: 28px;
    margin-bottom: 30px;
    position: relative;
    padding-bottom: 10px;
    font-weight: bold;
}

h2::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 2px;
    background-color: #800080;
}

/* ✅ 信息项样式：浅紫分隔线+间距优化，强化阅读体验 */
.info-item {
    margin: 20px 0;
    padding: 10px 0;
    border-bottom: 1px solid rgba(128, 0, 128, 0.25);
}

/* ✅ 标签样式：深紫+楷体加粗+字号适配，与表单页完全统一 */
.label {
    display: inline-block;
    width: 100px;
    font-weight: bolder;
    color: #800080;
    font-size: 19px;
    font-family: "楷体", sans-serif;
}

/* ✅ 内容文字样式：楷体优先+深灰配色，保证阅读舒适度 */
.info-item span + span, .info-item {
    font-family: "楷体", sans-serif;
    font-size: 18px;
    color: #333;
}

/* ✅ 按钮组+按钮样式：保留镂空紫框+hover特效，与全项目按钮一致 */
.button-group {
    text-align: center;
    margin-top: 35px;
    padding-top: 20px;
    border-top: 1px solid rgba(128, 0, 128, 0.25);
}

.back-button {
    display: inline-block;
    width: 140px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    padding: 11px 0;
    border-radius: 8px;
    cursor: pointer;
    font-family: "楷体", sans-serif;
    font-size: 18px;
    font-weight: bold;
    text-decoration: none;
    transition: all 0.3s ease;
    margin: 0 8px 15px;
}

.back-button:hover {
    background-color: #800080;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(128, 0, 128, 0.2);
}

/* ✅ 响应式适配：兼容小屏，样式不跑偏 */
@media (max-width: 576px) {
    .container {
        width: 100%;
        padding: 25px 20px;
    }
    .label {
        width: 80px;
        font-size: 17px;
    }
    .back-button {
        width: 120px;
        margin: 0 5px 15px;
        font-size: 16px;
    }
}
</style>
</head>
<body>
    <%
        // 从Session中获取查询到的学生信息
        Student student = (Student) session.getAttribute("student");
        // 若未获取到（如直接访问该页面），跳转回查询页
        if (student == null) {
            response.sendRedirect("toCheckStudent");
            return;
        }
    %>
    <div class="container">
        <h2>学生信息查询结果</h2>
        
        <!-- 展示学生信息 -->
        <div class="info-item">
            <span class="label">学号：</span>
            <%= student.getSno() %>
        </div>
        
        <div class="info-item">
            <span class="label">姓名：</span>
            <%= student.getSname() %>
        </div>
        
        <div class="info-item">
            <span class="label">密码：</span>
            <%= student.getPwd() %>
        </div>
        
        <div class="info-item">
            <span class="label">年龄：</span>
            <%= student.getAge() %>
        </div>
        
        <div class="info-item">
            <span class="label">爱好：</span>
            <%= student.getHobbit() != null ? student.getHobbit() : "未填写" %>
        </div>
        
        <div class="info-item">
            <span class="label">地址：</span>
            <%= student.getAddress() != null ? student.getAddress() : "未填写" %>
        </div>
        
        <!-- 功能按钮：路径优化为绝对路径，避免404 -->
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/toCheckStudent" class="back-button">返回查询</a>
            <a href="${pageContext.request.contextPath}/toMain" class="back-button">返回首页</a>
            <a href="${pageContext.request.contextPath}/showAllStudents" class="back-button">查看所有学生</a>
        </div>
    </div>
</body>
</html>