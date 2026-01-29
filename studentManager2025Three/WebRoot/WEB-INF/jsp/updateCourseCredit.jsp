<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>修改课程学分</title>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
/* ✅ 全局背景 - 与所有页面1:1统一，绝对路径永不404 */
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
/* ✅ 核心容器 - 必加2px深紫边框 + 毛玻璃质感 + 统一圆角阴影 */
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
    border: 2px solid #800080; /* ✅ 核心要求：醒目深紫色主边框，全项目统一 */
}
/* ✅ 标题样式 - 深紫配色+下划线，与所有页面标题规范一致 */
h2 {
    color: #800080;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 30px;
    padding-bottom: 12px;
    border-bottom: 2px solid #800080;
}
/* ✅ 表单标签 - 深紫+楷体加粗+排版优化，强化阅读体验 */
span {
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-weight: bolder;
    color: #800080;
    font-size: 18px;
    display: inline-block;
    width: 120px;
}
/* ✅ 输入框 - 圆角优化+间距调整，适配统一风格，强化输入体验 */
input {
    margin-bottom: 20px;
    padding: 10px 8px;
    width: 300px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-size: 16px;
}
/* ✅ 按钮容器 - 间距优化，居中对齐更协调 */
.buttons {
    margin-top: 25px;
    text-align: center;
}
/* ✅ 按钮统一 - 紫框透明底+hover填充特效，与全项目按钮交互一致 */
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
/* ✅ 按钮hover特效 - 紫底白字+悬浮阴影，交互体验统一丝滑 */
input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #800080;
    color: #ffffff;
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}
/* ✅ 错误提示 - 深紫配色统一项目色系，醒目且协调，强化阅读 */
.errorMsg {
    color: #800080;
    text-align: center;
    margin-top: 15px;
    font-size: 18px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-weight: 500;
}
</style>
</head>
<body>
    <div class="container">
        <h2>修改课程学分</h2>
        <form action="updateCourseCredit" method="post">
            <span>课程编号：</span>
            <input type="text" name="CnoStr" required placeholder="请输入要修改的课程编号"/><br>
            
            <span>新学分：</span>
            <input type="text" name="newCreditStr" required placeholder="请输入0-10之间的数字"/><br>
            
            <div class="buttons">
                <input type="submit" value="修改学分"/>
                <input type="button" value="返回首页" onclick="location.href='${pageContext.request.contextPath}/toMain'" style="margin-left: 20px;"/>
            </div>
        </form>
    </div>
</body>
</html>