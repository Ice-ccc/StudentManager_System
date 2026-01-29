<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新建教师成功</title>
<style type="text/css">
/* ✅ 核心修改：毛玻璃紫色半透明质感 + 背景图替换为loginbackground.png + 统一紫色主题 */
body {
    background-image: url("../img/loginbackground.png"); /* ✅ 更换为指定背景图 */
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
    background-color: rgba(255, 255, 255, 0.4); /* ✅ 0.4透明度实现毛玻璃通透感 */
    padding: 30px;
    border-radius: 16px; /* ✅ 统一项目16px圆角标准 */
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15); /* ✅ 深紫色系柔影 */
    text-align: center;
    border: 2px solid #800080; /* ✅ 紫色主边框，和其他页面一致 */
    backdrop-filter: blur(8px); /* ✅ 毛玻璃模糊核心效果 */
    -webkit-backdrop-filter: blur(8px); /* ✅ 兼容Safari浏览器 */
}
/* 成功提示标题 */
.success-title {
    color: #28a745; /* 保留成功绿，视觉更醒目 */
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 20px;
}
.success-title i {
    font-size: 40px;
    margin-right: 10px;
}
/* 提示信息 */
.success-desc {
    font-size: 18px;
    color: #333;
    margin-bottom: 30px;
    line-height: 1.8;
}
/* 按钮组样式 - 统一深紫色主题，匹配毛玻璃风格 */
.btn-group {
    display: flex;
    justify-content: center;
    gap: 15px;
    flex-wrap: wrap;
}
.btn {
    background-color: #800080; /* ✅ 统一深紫色按钮，和其他页面一致 */
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 6px; /* ✅ 统一6px圆角 */
    cursor: pointer;
    font-size: 16px;
    font-family: 楷体;
    transition: all 0.35s ease; /* ✅ 丝滑hover过渡 */
}
.btn:hover {
    background-color: #6a0dad; /* ✅ hover加深紫色 */
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2); /* ✅ 悬浮阴影，提升质感 */
}
/* 备用按钮样式（浅紫半透，匹配毛玻璃风格） */
.btn-secondary {
    background-color: rgba(233, 213, 255, 0.8); /* ✅ 浅紫半透明，适配毛玻璃 */
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
        <div class="success-title">
            <i class="fa fa-check-circle"></i> 新建教师成功！
        </div>
        
        <div class="success-desc">
            您已成功添加教师信息，数据已保存至系统<br>
            可选择下方操作继续使用系统功能
        </div>

        <%-- ✅ 所有按钮跳转逻辑、文案、图标 完全未变，保留原始写法 --%>
        <div class="btn-group">
            <button class="btn" onclick="window.location.href='toManageteacher'">
                <i class="fa fa-tasks"></i> 返回教师管理中心
            </button>
            <button class="btn" onclick="window.location.href='toAddteacher'">
                <i class="fa fa-plus"></i> 继续新增教师
            </button>
            <button class="btn btn-secondary" onclick="window.location.href='/studentManager2025Three/toMain'">
    			<i class="fa fa-home"></i> 返回主页
			</button>
        </div>
    </div>
</body>
</html>