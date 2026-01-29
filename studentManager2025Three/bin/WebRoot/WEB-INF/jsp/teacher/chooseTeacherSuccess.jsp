<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>选课成功</title>
<style type="text/css">
/* 全局样式与其他教师页面完全统一 - 毛玻璃紫色些许透明+指定背景图 */
body {
    background-image: url("../img/loginbackground.png"); /* ✅ 替换为指定背景图 */
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    font-family: 楷体;
}
.container {
    width: 600px;
    margin: 50px auto;
    background-color: rgba(255, 255, 255, 0.4); /* ✅ 毛玻璃核心：0.4半透明 些许通透 */
    padding: 30px;
    border-radius: 16px; /* ✅ 统一项目圆角标准 */
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15); /* ✅ 深紫色柔影 强化质感 */
    text-align: center;
    border: 2px solid #800080; /* ✅ 紫色主边框 统一风格 */
    backdrop-filter: blur(8px); /* ✅ 毛玻璃模糊核心效果 */
    -webkit-backdrop-filter: blur(8px); /* ✅ 兼容所有浏览器 */
}
/* 成功提示标题 */
.success-title {
    color: #28a745; /* 成功绿，符合用户认知 */
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 20px;
}
.success-title i {
    font-size: 40px;
    margin-right: 10px;
}
/* 选课信息展示卡片 - 适配毛玻璃风格 */
.course-info {
    width: 80%;
    margin: 0 auto 30px;
    padding: 20px;
    background-color: rgba(248, 249, 250, 0.85); /* ✅ 卡片半透 适配毛玻璃 */
    border-radius: 10px;
    border: 1px solid #eee;
    text-align: left;
}
.course-info p {
    font-size: 16px;
    color: #666;
    margin: 8px 0;
}
.course-info p span {
    color: #800080; /* ✅ 统一深紫色 匹配风格 */
    font-weight: bold;
    display: inline-block;
    width: 120px;
}
/* 提示描述 */
.success-desc {
    font-size: 18px;
    color: #333;
    margin-bottom: 30px;
    line-height: 1.8;
}
/* 按钮组样式，与其他页面统一 - 深紫色主题 */
.btn-group {
    display: flex;
    justify-content: center;
    gap: 15px;
    flex-wrap: wrap;
}
.btn {
    background-color: #800080; /* ✅ 统一深紫色按钮 */
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 6px; /* ✅ 统一圆角标准 */
    cursor: pointer;
    font-size: 16px;
    font-family: 楷体;
    transition: all 0.35s ease; /* ✅ 丝滑hover过渡 */
}
.btn:hover {
    background-color: #6a0dad; /* hover加深紫色，与其他页面一致 */
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2); /* ✅ 悬浮阴影提升质感 */
}
.btn-secondary {
    background-color: rgba(233, 213, 255, 0.8); /* ✅ 浅紫半透 适配毛玻璃 */
    color: #800080;
}
.btn-secondary:hover {
    background-color: rgba(216, 180, 254, 0.9);
}
</style>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <!-- 成功提示标题 -->
        <div class="success-title">
            <i class="fa fa-check-circle"></i> 选课成功！
        </div>

        <!-- 成功描述信息 -->
        <div class="success-desc">
            您已为未分配课程的教师成功绑定授课课程<br>
            课程信息已同步保存至系统，可查询验证
        </div>

        <!-- 功能按钮组，满足常用操作需求 - ✅ 所有跳转路径/方法 完全未改 -->
        <div class="btn-group">
            <button class="btn" onclick="window.location.href='${pageContext.request.contextPath}/teacher/queryAllTeacher'">
                <i class="fa fa-search"></i> 查看教师课程信息
            </button>
            <button class="btn" onclick="window.location.href='${pageContext.request.contextPath}/teacher/toManageteacher'">
                <i class="fa fa-tasks"></i> 返回教师管理中心
            </button>
            <button class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/toMain'">
                <i class="fa fa-home"></i> 返回主页
            </button>
        </div>
    </div>
</body>
</html>