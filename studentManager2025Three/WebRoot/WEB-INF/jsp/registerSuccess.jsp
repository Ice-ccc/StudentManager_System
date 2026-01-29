<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 注册成功后5秒跳转至首页 ✅ 修复跳转路径前缀 -->
<meta http-equiv="refresh" content="5;url=${pageContext.request.contextPath}/index">
<title>注册成功</title>
<style type="text/css">
/* ✅ 全站统一：指定背景图 + 移除花哨字体 + 匹配布局规范 */
body{
    margin: 0;
    padding: 0;
    height: 100vh;
    font-family: "微软雅黑", 楷体, sans-serif;
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    background-attachment: fixed;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
/* ✅ 核心：毛玻璃紫色通透容器（和登录/注册页1:1一致） */
.success-container {
    width: 500px;
    text-align: center;
    padding: 40px 30px;
    background-color: rgba(255,255,255,0.4);
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    border: 2px solid #800080;
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
}
/* ✅ 标题：全站统一紫色 + 加粗醒目 */
h1 {
    color: #800080;
    margin-bottom: 20px;
    font-size: 22px;
    font-weight: bold;
}
/* ✅ 文案：深色适配 + 字号统一，保证可读性 */
p {
    color: #333;
    font-size: 16px;
    margin-bottom: 25px;
    line-height: 1.6;
}
/* ✅ 进度条：紫色主色 + 尺寸优化，匹配整体风格 */
.loader {
    width: 280px;
    height: 8px;
    background-color: #f0f0f0;
    border-radius: 8px;
    margin: 0 auto 20px;
    overflow: hidden;
}
.progress {
    height: 100%;
    background-color: #800080;
    width: 0%;
    transition: width 1s linear;
}
/* ✅ 跳转链接：紫色配色 + hover加深，统一交互规范 */
.redirect-link {
    color: #800080;
    text-decoration: none;
    font-weight: bold;
}
.redirect-link:hover {
    color: #6a0dad;
    text-decoration: underline;
}
</style>
</head>
<body>
    <div class="success-container">
        <% 
            // 从request中获取注册的用户名（如果有传递）
            String username = (String) request.getAttribute("username");
            if (username != null && !username.trim().isEmpty()) {
        %>
            <h1>注册成功！欢迎您，<%= username %>！</h1>
        <% 
            } else { 
        %>
            <h1>注册成功！</h1>
        <% 
            } 
        %>
        <p>正在跳转到首页，<span id="countdown">5</span>秒后自动跳转...</p>
        <div class="loader">
            <div class="progress" id="progressBar"></div>
        </div>
        <!-- ✅ 修复手动跳转路径，补全项目根前缀 -->
        <p>如果没有自动跳转，请<a href="${pageContext.request.contextPath}/index" class="redirect-link">点击这里</a></p>
    </div>

    <script type="text/javascript">
        // 倒计时功能 ✅ 保留原有逻辑 + 修复JS跳转路径
        let seconds = 5;
        const countdownElement = document.getElementById('countdown');
        const progressBar = document.getElementById('progressBar');
        
        // 更新进度条和倒计时
        function updateCountdown() {
            seconds--;
            countdownElement.textContent = seconds;
            // 进度条百分比计算（5秒内从0%到100%）
            const progress = 100 - (seconds / 5 * 100);
            progressBar.style.width = progress + '%';
            
            if (seconds <= 0) {
                // ✅ 修复JS强制跳转路径，补全项目根前缀
                window.location.href = '${pageContext.request.contextPath}/index';
            } else {
                setTimeout(updateCountdown, 1000);
            }
        }
        
        // 启动倒计时
        setTimeout(updateCountdown, 1000);
    </script>
</body>
</html>