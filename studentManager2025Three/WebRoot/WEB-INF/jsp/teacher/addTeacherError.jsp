<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新建教师失败</title>
<style type="text/css">
/* ✅ 统一毛玻璃紫色半透明风格 + 背景图替换为loginbackground.png */
body {
    background-image: url("../img/loginbackground.png"); /* ✅ 指定背景图 */
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
    background-color: rgba(255, 255, 255, 0.4); /* ✅ 毛玻璃核心：0.4半透明 */
    padding: 30px;
    border-radius: 16px; /* ✅ 项目统一16px圆角 */
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15); /* ✅ 深紫色柔影 */
    text-align: center;
    border: 2px solid #800080; /* ✅ 紫色主边框，和所有页面一致 */
    backdrop-filter: blur(8px); /* ✅ 毛玻璃模糊效果 */
    -webkit-backdrop-filter: blur(8px); /* ✅ 兼容Safari浏览器 */
}
/* 失败提示标题 */
.error-title {
    color: #dc3545; /* 保留错误红，提示醒目 */
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 20px;
}
.error-title i {
    font-size: 40px;
    margin-right: 10px;
}
/* 提示信息 */
.error-desc {
    font-size: 18px;
    color: #333;
    margin-bottom: 30px;
    line-height: 1.8;
}
/* 按钮组样式 - 统一深紫色主题 */
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
    border-radius: 6px; /* ✅ 统一6px圆角 */
    cursor: pointer;
    font-size: 16px;
    font-family: 楷体;
    transition: all 0.35s ease; /* ✅ 丝滑hover过渡 */
}
.btn:hover {
    background-color: #6a0dad; /* ✅ hover加深紫色 */
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2); /* ✅ 悬浮阴影提升质感 */
}
/* 备用按钮样式（浅紫半透，适配毛玻璃） */
.btn-secondary {
    background-color: rgba(233, 213, 255, 0.8); /* ✅ 浅紫半透明，匹配风格 */
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
        <div class="error-title">
            <i class="fa fa-exclamation-circle"></i> 新建教师失败！
        </div>
        
        <%-- 显示具体失败原因 - 保留原有Java代码逻辑 --%>
        <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
        <div class="error-desc">
            <%= errorMsg != null ? errorMsg : "新增教师信息时出现未知错误" %>
            <br>请核对信息后重新尝试
        </div>

        <%-- ✅ 所有按钮跳转逻辑、文案、图标 完全未变，原样保留 --%>
        <div class="btn-group">
            <button class="btn" onclick="window.location.href='toAddteacher'">
                <i class="fa fa-refresh"></i> 重新新增教师
            </button>
            <button class="btn" onclick="window.location.href='toManageteacher'">
                <i class="fa fa-tasks"></i> 返回教师管理中心
            </button>
          	<button class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/toMain'">
    			<i class="fa fa-home"></i> 返回主页
			</button>
        </div>
    </div>
</body>
</html>