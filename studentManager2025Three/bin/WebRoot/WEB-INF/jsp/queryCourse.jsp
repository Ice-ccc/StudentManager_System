<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>查询课程</title>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
/* ✅ 全局背景 - 与项目所有页面1:1统一，必显不跑偏 */
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
    width: 500px;
    margin: 0 auto;
    margin-top: 8%;
    background-color: rgba(255, 255, 255, 0.45);
    padding: 35px 25px;
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
/* ✅ 输入框 - 圆角优化+间距调整，适配统一视觉风格 */
input {
    margin-bottom: 20px;
    padding: 10px 8px;
    width: 300px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-size: 16px;
}
/* ✅ 按钮容器 - 间距优化，适配多按钮排版，居中对齐更协调 */
.buttons {
    margin-top: 25px;
    text-align: center;
}
/* ✅ 按钮统一 - 紫框透明底+hover填充特效，与提示/新增/删除页按钮完全一致 */
input[type="submit"], input[type="button"] {
    width: 130px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    padding: 10px 0;
    border-radius: 6px;
    cursor: pointer;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-size: 16px;
    font-weight: bold;
    transition: all 0.35s ease;
}
/* ✅ 按钮hover特效 - 紫底白字+悬浮阴影，全套统一交互体验 */
input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #800080;
    color: #ffffff;
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}
/* ✅ 错误提示 - 深紫配色统一项目色系，醒目且协调 */
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
        <h2>查询课程信息</h2>
        <form action="queryCourseByCno" method="post">
            <span>课程编号：</span>
            <input type="text" name="CnoStr" required placeholder="请输入课程编号查询"/><br>
            
            <div class="buttons">
                <input type="submit" value="按编号查询"/>
                <input type="button" value="查询所有课程" onclick="location.href='${pageContext.request.contextPath}/queryAllCourse'" style="margin-left: 8px;"/>
                <input type="button" value="返回首页" onclick="location.href='${pageContext.request.contextPath}/toMain'" style="margin-left: 8px;"/>
            </div>
        </form>
    </div>
</body>
</html>