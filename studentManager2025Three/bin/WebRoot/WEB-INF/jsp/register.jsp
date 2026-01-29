<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
<style type="text/css">
/* 页面整体样式 - 不变 */
body {
    margin: 0;
    padding: 0;
    height: 100vh;
    font-family: "微软雅黑";
    background-image: url("img/loginbackground.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    background-attachment: fixed;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    overflow: hidden;
}

/* 容器尺寸/布局 - 不变 */
.register-container {
    width: 800px;
    height: 480px;
    display: flex;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 6px 20px rgba(0,0,0,0.12);
    position: relative;
    z-index: 1;
}

/* ✅ 核心优化：缩小表单区内边距，整体更紧凑 */
.register-form {
    flex: 1;
    padding: 25px 30px; /* 大幅缩减内边距，适配缩小后的元素 */
    background-color: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

/* ✅ 缩小标题字号，比例协调 */
.register-form h2 {
    text-align: center;
    margin: 0 0 20px 0; /* 缩减标题下方间距 */
    color: #333;
    font-size: 20px; /* 从24px缩小至20px */
    font-weight: normal;
}

/* ✅ 核心调整：输入框+间距 整体缩小（符合显示逻辑）*/
.register-form .form-item {
    margin-bottom: 12px; /* 从22px缩至12px，解决拥挤问题 */
}
.register-form input {
    width: 100%;
    height: 36px; /* 从42px缩至36px，核心缩小 */
    padding: 0 10px; /* 缩减内边距 */
    border: 1px solid #e0e0e0;
    border-radius: 6px;
    outline: none;
    font-size: 14px; /* 从16px缩至14px，视觉更匹配 */
    color: #333;
    box-sizing: border-box;
}
.register-form input:focus {
    border-color: #ffc107;
}

/* ✅ 核心调整：按钮尺寸缩小，与输入框比例统一 */
.register-form .submit-btn {
    width: 100%;
    height: 40px; /* 从46px缩至40px */
    background-color: #ffb800;
    color: #fff;
    border: none;
    border-radius: 6px;
    font-size: 16px; /* 从18px缩至16px */
    cursor: pointer;
    transition: background-color 0.2s;
    margin-top: 8px; /* 缩减顶部间距 */
}
.register-form .submit-btn:hover {
    background-color: #ff9800;
}

/* 右侧图片区 - 完全不变 */
.register-img {
    flex: 1;
    height: 100%;
    background-image: url("img/login.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    position: relative;
}
.register-img .login-link {
    position: absolute;
    bottom: 30px;
    left: 50%;
    transform: translateX(-50%);
    text-align: center;
    font-size: 14px;
    color: #666;
}
.register-img .login-link a {
    color: #ffb800;
    text-decoration: none;
    margin-left: 5px;
}
.register-img .login-link a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>
    <div class="register-container">
        <!-- 左侧注册表单 ✅ 6个输入框数量/功能完全不变 -->
        <div class="register-form">
            <h2>用户注册</h2>
            <form action="registerStudent" method="post">
                <div class="form-item">
                    <input type="text" name="sno" placeholder="学号" required/>
                </div>
                <div class="form-item">
                    <input type="text" name="sname" placeholder="姓名" required/>
                </div>
                <div class="form-item">
                    <input type="text" name="pwd" placeholder="密码" required/>
                </div>
                <div class="form-item">
                    <input type="text" name="age" placeholder="年龄" required/>
                </div>
                <div class="form-item">
                    <input type="text" name="hobbit" placeholder="爱好" required/>
                </div>
                <div class="form-item">
                    <input type="text" name="address" placeholder="地址" required/>
                </div>
                <button type="submit" class="submit-btn">注册</button>
            </form>
        </div>

        <!-- 右侧图片+登录链接 ✅ 完全不变 -->
        <div class="register-img">
            <div class="login-link">
                已有账号？<a href="toLogin">去登录</a>
            </div>
        </div>
    </div>
</body>
</html>