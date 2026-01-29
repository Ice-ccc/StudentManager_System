<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
<style type="text/css">
/* ✅ 页面整体：指定背景图 + 移除overflow:hidden + 统一字体 */
body {
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
    justify-content: center;
    align-items: center;
    position: relative;
}

/* ✅ 核心容器：毛玻璃紫色边框 + 统一圆角/阴影 + 尺寸不变 */
.register-container {
    width: 800px;
    height: 480px;
    display: flex;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    position: relative;
    z-index: 1;
    border: 2px solid #800080;
}

/* ✅ 表单区：毛玻璃通透底色 + 原有内边距/紧凑布局完全保留 */
.register-form {
    flex: 1;
    padding: 25px 30px;
    background-color: rgba(255,255,255,0.4);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    display: flex;
    flex-direction: column;
    justify-content: center;
}

/* ✅ 标题：紫色主色调 + 字号/间距保留原有适配值 */
.register-form h2 {
    text-align: center;
    margin: 0 0 20px 0;
    color: #800080;
    font-size: 20px;
    font-weight: bold;
}

/* ✅ 输入框：保留原有紧凑尺寸 + 紫色聚焦边框 + 通透底色 */
.register-form .form-item {
    margin-bottom: 12px;
}
.register-form input {
    width: 100%;
    height: 36px;
    padding: 0 10px;
    border: 1px solid #dcdcdc;
    border-radius: 8px;
    outline: none;
    font-size: 14px;
    color: #333;
    box-sizing: border-box;
    background-color: rgba(255,255,255,0.6);
}
.register-form input:focus {
    border-color: #800080;
    box-shadow: 0 0 0 2px rgba(128,0,128,0.1);
}

/* ✅ 注册按钮：紫色主色 + hover加深 + 保留原有尺寸 */
.register-form .submit-btn {
    width: 100%;
    height: 40px;
    background-color: #800080;
    color: #fff;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.2s ease;
    margin-top: 8px;
}
.register-form .submit-btn:hover {
    background-color: #6a0dad;
}

/* ✅ 右侧图片区：保留原有布局 + 补全路径 + 登录链接改为紫色 */
.register-img {
    flex: 1;
    height: 100%;
    background-image: url("${pageContext.request.contextPath}/img/login.png");
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
    color: #fff;
    text-shadow: 0 1px 2px rgba(0,0,0,0.3);
}
.register-img .login-link a {
    color: #fff;
    text-decoration: underline;
    margin-left: 5px;
    font-weight: 500;
}
.register-img .login-link a:hover {
    color: #f0e6ff;
}
</style>
</head>
<body>
    <div class="register-container">
        <!-- 左侧注册表单：保留原有6个输入框/功能，仅修复提交路径 -->
        <div class="register-form">
            <h2>用户注册</h2>
            <form action="${pageContext.request.contextPath}/registerStudent" method="post">
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

        <!-- 右侧图片+登录链接：保留原有布局，修复跳转路径 -->
        <div class="register-img">
            <div class="login-link">
                已有账号？<a href="${pageContext.request.contextPath}/toLogin">去登录</a>
            </div>
        </div>
    </div>
</body>
</html>