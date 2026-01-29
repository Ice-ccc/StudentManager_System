<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>新增课程信息</title>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
/* ✅ 完全统一的背景样式 - 和课程/教师页面一致 */
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
/* ✅ 统一毛玻璃容器样式 - 圆角/阴影/半透/模糊 完全匹配 */
.container {
    width: 500px;
    margin: 0 auto;
    margin-top: 8%;
    background-color: rgba(255, 255, 255, 0.4);
    padding: 30px 20px;
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.1);
    backdrop-filter: blur(5px);
    -webkit-backdrop-filter: blur(5px);
    border: 1px solid rgba(255,255,255,0.5);
}
/* ✅ 统一标题样式 - 深紫色/字号/下划线 完全匹配 */
h2 {
    color: #800080;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 30px;
    padding-bottom: 10px;
    border-bottom: 3px solid #800080;
}
/* ✅ 表单标签样式优化 - 统一深紫色/楷体/排版 */
span {
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-weight: bolder;
    color: #800080;
    font-size: 18px;
    display: inline-block;
    width: 120px;
}
/* ✅ 输入框样式优化 - 圆角/边框/间距 统一风格 */
input {
    margin-bottom: 20px;
    padding: 10px 8px;
    width: 300px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-size: 16px;
}
/* ✅ 按钮容器居中 - 统一间距 */
.buttons {
    margin-top: 25px;
    text-align: center;
}
/* ✅ 按钮样式完全统一 - 深紫色/hover效果/圆角 与其他页面一致 */
input[type="submit"], input[type="button"] {
    width: 120px;
    background-color: #800080;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 6px;
    cursor: pointer;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-size: 16px;
    transition: background-color 0.3s ease;
}
/* ✅ 按钮悬浮效果 - 统一加深紫色 与其他页面一致 */
input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #6a0dad;
}
</style>
</head>
<body>
    <div class="container">
        <h2>新增课程信息</h2>
        <form action="addCourse" method="post">
            <span>课程编号：</span>
            <input type="text" name="Cno" required placeholder="手动输入数字编号（不可重复）"/><br>
            
            <span>课程名称：</span>
            <input type="text" name="Cname" required placeholder="请输入课程名称"/><br>
            
            <span>课程学分：</span>
            <input type="text" name="Credit" required placeholder="请输入1-10之间的整数"/><br>
            
            <span>课程备注：</span>
            <input type="text" name="Comment" placeholder="可选，输入课程描述"/><br>
            
            <div class="buttons">
                <input type="submit" value="新增课程"/>
                <input type="button" value="返回首页" onclick="location.href='${pageContext.request.contextPath}/toMain'" style="margin-left: 20px;"/>
            </div>
        </form>
    </div>
</body>
</html>