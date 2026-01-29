<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 保持5秒后跳转至main.jsp -->
<meta http-equiv="refresh" content="5;url=${pageContext.request.contextPath}/toMain">
<title>登录成功</title>
<style type="text/css">
/* ✅ 统一项目风格：指定背景图 + 毛玻璃基础样式 */
body{
    margin: 0;
    padding: 0;
    height: 100vh;
    font-family: "微软雅黑", 楷体, sans-serif;
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    background-attachment: fixed;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
/* ✅ 核心：毛玻璃紫色些许透明容器（和登录/选课/公告页完全一致） */
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
/* ✅ 标题改为项目主紫色，加粗醒目 */
h1 {
    color: #800080;
    margin-bottom: 20px;
    font-size: 22px;
    font-weight: bold;
}
/* ✅ 文案配色优化，适配紫色风格 */
p {
    color: #333;
    font-size: 16px;
    margin-bottom: 25px;
    line-height: 1.6;
}
/* ✅ 进度条改为紫色渐变，匹配整体风格 */
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
/* ✅ 跳转链接改为紫色，hover加深，统一交互 */
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
        <p>如果没有自动跳转，请<a href="${pageContext.request.contextPath}/toMain" class="redirect-link">点击这里</a></p>
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
                window.location.href = '${pageContext.request.contextPath}/toMain';
            } else {
                setTimeout(updateCountdown, 1000);
            }
        }
        
        // 启动倒计时
        setTimeout(updateCountdown, 1000);
    </script>
</body>
</html>