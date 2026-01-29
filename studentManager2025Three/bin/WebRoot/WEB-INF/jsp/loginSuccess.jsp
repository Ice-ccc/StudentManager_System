<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 保持5秒后跳转至main.jsp -->
<meta http-equiv="refresh" content="5;url=toMain">
<title>登录成功</title>
<style type="text/css">
body{
    background-color: #E3F2FD;
    font-family: 'Comic Sans MS', 'Bubblegum Sans', cursive;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
}
.success-container {
    text-align: center;
    padding: 2rem;
    background-color: white;
    border-radius: 2xl;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}
h1 {
    color: #FF9BB3;
    margin-bottom: 1.5rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
}
p {
    color: #1D3557;
    font-size: 1.2rem;
    margin-bottom: 2rem;
}
.loader {
    width: 50px;
    height: 5px;
    background-color: #e0e0e0;
    border-radius: 5px;
    margin: 0 auto 1rem;
    overflow: hidden;
}
.progress {
    height: 100%;
    background-color: #A8DADC;
    width: 0%;
    transition: width 1s linear;
}
.redirect-link {
    color: #FF9BB3;
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
    // 从Session获取用户名和学号
    String studentName = (String) session.getAttribute("sname");
    Integer sno = (Integer) session.getAttribute("sno"); // 改为Integer类型
    
    if (studentName != null && !studentName.trim().isEmpty() && sno != null) {
        // 显示个性化欢迎信息
%>
    <h1>登录成功！欢迎您，<%= studentName %>同学（学号：<%= sno.toString() %>）！</h1>
<% 
    } else { 
%>
    <h1>登录成功！</h1>
<% 
    } 
%>
        <p>正在跳转到系统首页，<span id="countdown">5</span>秒后自动跳转...</p>
        <div class="loader">
            <div class="progress" id="progressBar"></div>
        </div>
        <p>如果没有自动跳转，请<a href="toMain" class="redirect-link">点击这里</a></p>
    </div>

    <script type="text/javascript">
        let seconds = 5;
        const countdownElement = document.getElementById('countdown');
        const progressBar = document.getElementById('progressBar');
        
        // 更新倒计时和进度条
        function updateCountdown() {
            seconds--;
            countdownElement.textContent = seconds;
            // 进度条随时间增长（5秒从0%到100%）
            const progress = 100 - (seconds / 5 * 100);
            progressBar.style.width = progress + '%';
            
            if (seconds <= 0) {
                // 倒计时结束，强制跳转至main.jsp
                window.location.href = 'toMain';
            } else {
                setTimeout(updateCountdown, 1000);
            }
        }
        
        // 启动倒计时
        setTimeout(updateCountdown, 1000);
    </script>
</body>
</html>