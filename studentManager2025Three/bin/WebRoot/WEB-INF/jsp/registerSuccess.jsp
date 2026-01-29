<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 注册成功后5秒跳转至index.jsp -->
<meta http-equiv="refresh" content="5;url=index">
<title>注册成功</title>
<style type="text/css">
body{
    background-color: #E8F5E9; /* 浅绿色背景，与注册成功的积极氛围匹配 */
    font-family: 'Comic Sans MS', 'Bubblegum Sans', cursive;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
    /* ✅ 核心新增：背景图样式 - 全屏铺满、不重复、居中适配 */
    background-image: url(img/loginbackground.png);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    background-attachment: fixed;
}
.success-container {
    text-align: center;
    padding: 2rem;
    background-color: white;
    border-radius: 20px; /* 调整为兼容的像素值 */
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    /* ✅ 优化：增加白色透明底色，保证文字清晰、不被背景图遮挡 */
    background-color: rgba(255, 255, 255, 0.9);
}
h1 {
    color: #4CAF50; /* 绿色系标题，体现成功状态 */
    margin-bottom: 1.5rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
}
p {
    color: #1B5E20; /* 深绿色文字，保持风格统一 */
    font-size: 1.2rem;
    margin-bottom: 2rem;
}
.loader {
    width: 200px; /* 加宽进度条容器，视觉更协调 */
    height: 5px;
    background-color: #e0e0e0;
    border-radius: 5px;
    margin: 0 auto 1rem;
    overflow: hidden;
}
.progress {
    height: 100%;
    background-color: #81C784; /* 浅绿色进度条 */
    width: 0%;
    transition: width 1s linear;
}
.redirect-link {
    color: #4CAF50;
    text-decoration: none;
    font-weight: bold;
}
.redirect-link:hover {
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
        <!-- 手动跳转链接指向index.jsp -->
        <p>如果没有自动跳转，请<a href="index" class="redirect-link">点击这里</a></p>
    </div>

    <script type="text/javascript">
        // 倒计时功能
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
                // 跳转到index.jsp
                window.location.href = 'index';
            } else {
                setTimeout(updateCountdown, 1000);
            }
        }
        
        // 启动倒计时
        setTimeout(updateCountdown, 1000);
    </script>
</body>
</html>