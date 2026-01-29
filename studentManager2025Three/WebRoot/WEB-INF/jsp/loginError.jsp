<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录失败</title>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
/* ✅ 全局样式重置 + 基础规范 */
* { margin: 0; padding: 0; box-sizing: border-box; }
/* ✅ 全站统一：指定背景图 + 毛玻璃基础布局 + 字体规范 */
body {
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    min-height: 100vh;
    font-family: "微软雅黑", "楷体", sans-serif;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 1rem;
}
/* ✅ 核心容器：毛玻璃紫色些许透明（全站统一标准） */
.login-fail-container {
    width: 100%;
    max-width: 1200px;
    background-color: rgba(255, 255, 255, 0.4);
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border: 2px solid #800080;
    overflow: hidden;
    display: flex;
    flex-direction: column;
}
@media (min-width: 768px) {
    .login-fail-container { flex-direction: row; }
}
/* ✅ 左侧内容区：布局优化 + 紫色配色适配 */
.content-area {
    flex: 1;
    padding: 2rem;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
}
@media (min-width: 768px) {
    .content-area { padding: 3rem; align-items: flex-start; text-align: left; }
}
/* ✅ 失败图标：紫色主色 + 视觉放大 */
.fail-icon {
    color: #800080;
    margin-bottom: 1.5rem;
}
.fail-icon i { font-size: 5rem; }
/* ✅ 标题样式：紫色加粗 + 响应式字号 + 文字阴影 */
.fail-title {
    font-size: clamp(1.8rem, 5vw, 3rem);
    font-weight: bold;
    color: #800080;
    margin-bottom: 1rem;
    text-shadow: 0 2px 4px rgba(128,0,128,0.1);
}
/* ✅ 提示文案：深灰配色 + 行高优化 + 间距规范 */
.fail-desc {
    color: #333;
    font-size: 1rem;
    line-height: 1.6;
    margin-bottom: 0.8rem;
    max-width: 400px;
}
/* ✅ 倒计时文案：紫色高亮 + 醒目样式 */
.countdown-text {
    color: #800080;
    font-weight: bold;
    font-size: 1rem;
    margin: 1.2rem 0;
}
.countdown-text span { color: #6a0dad; font-size: 1.1rem; }
/* ✅ 返回按钮：全站统一紫色按钮 + hover动效（缩放+加深） */
.back-btn {
    background-color: #800080;
    color: #fff;
    font-weight: 500;
    padding: 0.8rem 2rem;
    border-radius: 8px;
    text-decoration: none;
    transition: all 0.3s ease;
    display: inline-block;
}
.back-btn:hover {
    background-color: #6a0dad;
    transform: scale(1.05);
    box-shadow: 0 6px 12px rgba(128,0,128,0.2);
}
/* ✅ 右侧图片区：保留浮动动画 + 毛玻璃通透底色 */
.img-area {
    width: 100%;
    padding: 2rem;
    background-color: rgba(255,255,255,0.2);
    display: flex;
    align-items: center;
    justify-content: center;
}
@media (min-width: 768px) { .img-area { width: 40%; } }
.img-area img {
    max-height: 180px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    animation: float 3s ease-in-out infinite;
}
@media (min-width: 768px) { .img-area img { max-height: 220px; } }
/* ✅ 保留原有浮动动画 */
@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-10px); }
    100% { transform: translateY(0px); }
}
</style>
</head>
<body>
    <div class="login-fail-container">
        <div class="content-area">
            <div class="fail-icon">
                <i class="fa fa-times-circle"></i>
            </div>
            <h1 class="fail-title">登录失败</h1>
            <p class="fail-desc">抱歉，用户名或密码不正确，请重新输入。</p>
            <p class="fail-desc">请检查您的登录信息，确保输入正确。</p>
            <!-- ✅ 新增：全站统一风格倒计时 -->
            <p class="countdown-text">将在 <span id="countdown">5</span> 秒后自动返回登录页...</p>
            <!-- ✅ 跳转路径完全未改动 -->
            <a href="toLogin" class="back-btn">立即返回登录页面</a>
        </div>
        <div class="img-area">
            <img src="img/789.gif" alt="登录失败提示图">
        </div>
    </div>

    <script type="text/javascript">
        // ✅ 新增：5秒自动返回倒计时（全站统一逻辑 + 紫色风格适配）
        let countdown = 5;
        const countdownEl = document.getElementById('countdown');
        const timer = setInterval(() => {
            countdown--;
            countdownEl.textContent = countdown;
            if (countdown <= 0) {
                clearInterval(timer);
                window.location.href = "toLogin"; // ✅ 跳转路径未改动
            }
        }, 1000);
    </script>
</body>
</html>