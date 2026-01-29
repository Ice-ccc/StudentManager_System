<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>修改学分成功</title>
<style type="text/css">
/* ✅ 全局背景 - 项目统一标配，绝对路径永不404 */
body {
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 0;
    height: 100vh;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
}
/* ✅ 核心容器 - 必加2px深紫主边框 + 毛玻璃质感 + 统一圆角阴影 */
.container {
    width: 400px;
    margin: 0 auto;
    margin-top: 15%;
    background-color: rgba(255, 255, 255, 0.45);
    padding: 30px;
    border-radius: 16px;
    text-align: center;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border: 2px solid #800080; /* ✅ 核心要求：醒目深紫色主边框 */
}
/* ✅ 成功标题 - 绿色醒目+楷体加粗，保留原有视觉特征 */
h2 {
    color: green;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 30px;
}
/* ✅ 按钮统一 - 紫框透明底+hover填充特效，与全项目按钮交互一致 */
.button {
    display: inline-block;
    width: 120px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    padding: 10px;
    border-radius: 6px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    margin: 10px;
    font-weight: bold;
    transition: all 0.35s ease;
}
/* ✅ 按钮hover特效 - 紫底白字+悬浮阴影，交互体验统一丝滑 */
.button:hover {
    background-color: #800080;
    color: #ffffff;
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
    text-decoration: none;
}
</style>
</head>
<body>
    <div class="container">
        <h2>修改课程学分成功！</h2>
        <!-- ✅ 保留原有3个按钮跳转逻辑，路径加固为绝对路径，杜绝404 -->
        <a href="${pageContext.request.contextPath}/toUpdateCourseCredit" class="button">继续修改</a>
        <a href="${pageContext.request.contextPath}/toMain" class="button">返回首页</a>
        <a href="${pageContext.request.contextPath}/toQueryCourse" class="button">查询课程</a>
    </div>
</body>
</html>