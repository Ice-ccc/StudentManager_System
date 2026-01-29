<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>新增课程成功</title>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
/* ✅ 全局背景 - 与所有页面1:1完全统一，背景必显不跑偏 */
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
/* ✅ 核心修改+美化：主容器添加紫色边框 + 升级毛玻璃质感 + 视觉优化 */
.container {
    width: 450px; /* 加宽更大气，适配阅读 */
    margin: 0 auto;
    margin-top: 10%; /* 优化垂直居中，更协调 */
    background-color: rgba(255, 255, 255, 0.45); /* 更通透的半透底色 */
    padding: 45px 35px; /* 加大内边距，告别拥挤 */
    border-radius: 20px; /* 大圆角更柔和，统一项目规范 */
    text-align: center;
    box-shadow: 0 10px 30px rgba(128, 0, 128, 0.15); /* 柔化阴影更高级 */
    backdrop-filter: blur(8px); /* 增强毛玻璃模糊，质感拉满 */
    -webkit-backdrop-filter: blur(8px);
    border: 2px solid #800080; /* ✅ 重点：主容器添加2px深紫色边框，醒目统一 */
}
/* ✅ 成功标题 - 优化配色/行高/间距，强化阅读+视觉层次 */
h2 {
    color: #28a745; /* 保留成功绿，喜庆且不违和 */
    font-size: 28px; /* 放大字号更醒目 */
    font-weight: bold;
    margin-bottom: 35px;
    padding-bottom: 20px;
    border-bottom: 2px solid #800080; /* 紫色分割线，呼应边框风格 */
    line-height: 1.2;
}
/* ✅ 按钮统一升级：紫色边框+透明底色（和提示页按钮完全一致，项目统一） */
.button {
    display: inline-block;
    width: 130px; /* 加宽按钮更美观 */
    height: 48px;
    line-height: 48px; /* 垂直居中文字，更工整 */
    background-color: transparent; /* 透明底色 */
    color: #800080; /* 深紫文字 */
    border: 2px solid #800080; /* 紫色边框，和容器呼应 */
    border-radius: 30px; /* 胶囊圆角极致美化 */
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-size: 18px; /* 放大字号，强化阅读 */
    font-weight: bold;
    margin: 0 12px; /* 优化按钮间距 */
    transition: all 0.35s ease; /* 丝滑过渡特效 */
}
/* ✅ 按钮hover高级特效 - 边框变填充+文字变白，交互统一 */
.button:hover {
    background-color: #800080;
    color: #ffffff;
    text-decoration: none;
    box-shadow: 0 5px 15px rgba(128, 0, 128, 0.2); /* 悬浮阴影增强层次感 */
}
</style>
</head>
<body>
    <div class="container">
        <h2>新增课程成功！</h2>
        <a href="${pageContext.request.contextPath}/toAddCourse" class="button">继续新增</a>
        <a href="${pageContext.request.contextPath}/toMain" class="button">返回首页</a>
    </div>
</body>
</html>