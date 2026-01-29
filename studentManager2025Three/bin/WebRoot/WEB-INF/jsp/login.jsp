<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
<style type="text/css">
/* 页面整体：背景图自适应屏幕 + 装饰元素 */
body {
    margin: 0;
    padding: 0;
    height: 100vh;
    font-family: "微软雅黑";
    background-image: url("img/33.png");
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

/* 整体容器：插画+登录框 左右分割成一个整体 */
.login-container {
    width: 800px;
    height: 480px;
    display: flex;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 6px 20px rgba(0,0,0,0.12);
    position: relative;
    z-index: 1;
}

/* 左侧插画区域（纯图片，无文字） */
.illustration-area {
    flex: 1;
    height: 100%;
    background-image: url("img/22.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}

/* 右侧登录框区域 */
.loginBox {
    flex: 1;
    padding: 40px 35px;
    background-color: #fff;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.loginBox h2 {
    text-align: center;
    margin: 0 0 30px 0;
    color: #333;
    font-size: 24px;
}

/* 输入项样式 */
.form-item {
    margin-bottom: 22px;
    display: flex;
    align-items: center;
}
.form-item label {
    width: 70px;
    font-size: 16px;
    color: #666;
}
/* 密码输入框容器：新增相对定位，用于放置切换按钮 */
.pwd-input-wrapper {
    flex: 1;
    position: relative;
}
.form-item input {
    flex: 1;
    height: 42px;
    padding: 0 12px;
    border: 1px solid #e0e0e0;
    border-radius: 6px;
    outline: none;
    font-size: 16px;
    width: 100%; /* 密码框宽度100% */
    box-sizing: border-box; /* 防止padding撑大宽度 */
}
.form-item input:focus {
    border-color: #ffc107;
}

/* 新增：密码显示/隐藏按钮样式（适配文字版） */
.toggle-pwd {
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    background: none;
    border: none;
    cursor: pointer;
    font-size: 14px;
    color: #999;
    padding: 2px 8px; /* 适配文字的内边距 */
    line-height: 1; /* 行高重置 */
    font-family: "微软雅黑"; /* 统一字体 */
}
.toggle-pwd:hover {
    color: #ffb800;
}

/* 忘记密码 */
.forget-pwd {
    text-align: right;
    margin: -12px 0 20px 0;
}
.forget-pwd a {
    color: #ffb800;
    font-size: 14px;
    text-decoration: none;
}
.forget-pwd a:hover {
    text-decoration: underline;
}

/* 记住密码 */
.remember-pwd {
    margin-bottom: 25px;
    font-size: 14px;
    color: #666;
}
.remember-pwd input {
    width: 16px;
    height: 16px;
    margin-right: 8px;
}

/* 登录按钮 */
.submitBtn {
    width: 100%;
    height: 46px;
    background-color: #ffb800;
    color: #fff;
    border: none;
    border-radius: 6px;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.2s;
}
.submitBtn:hover {
    background-color: #ff9800;
}

/* 注册链接样式 */
.register-link {
    text-align: center;
    margin-top: 15px;
    font-size: 14px;
    color: #666;
}
.register-link a {
    color: #ffb800;
    text-decoration: none;
    margin-left: 5px;
}
.register-link a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>
    <!-- 整体容器（插画+登录框合并为一个整体） -->
    <div class="login-container">
        <!-- 右侧登录框 -->
        <div class="loginBox">
            <h2>用户登录</h2>
            <form action="loginStudent" method="post" id="loginForm">
                <div class="form-item">
                    <label>学号：</label>
                    <input type="text" name="sno" id="sno" required/>
                </div>
                <div class="form-item">
                    <label>密码：</label>
                    <!-- 新增：密码输入框容器，用于放置切换按钮 -->
                    <div class="pwd-input-wrapper">
                        <input type="password" name="pwd" id="pwd" required/>
                        <!-- 新增：密码显示/隐藏按钮（初始文字为“显示”） -->
                        <button type="button" class="toggle-pwd" id="togglePwd">显示</button>
                    </div>
                </div>
                
                <div class="forget-pwd">
                    <a href="toModifyPwd">忘记密码？</a>
                </div>
                
                <div class="remember-pwd">
                    <input type="checkbox" name="remember" id="remember"/>
                    <label for="remember">记住密码</label>
                </div>
                
                <input type="submit" value="登录" class="submitBtn"/>
                
                <!-- 注册链接 -->
                <div class="register-link">
                    还没有账号？<a href="toRegister">请先注册</a>
                </div>
            </form>
        </div>

        <!-- 左侧插画（纯图片，无文字） -->
        <div class="illustration-area"></div>
    </div>

    <script type="text/javascript">
        // 页面加载时，读取Cookie中的账号密码并填充
        window.onload = function() {
            // 读取Cookie
            const cookieSno = getCookie("rememberSno");
            const cookiePwd = getCookie("rememberPwd");
            
            // 如果Cookie中有值，填充到输入框，并且勾选"记住密码"
            if (cookieSno && cookiePwd) {
                document.getElementById("sno").value = cookieSno;
                document.getElementById("pwd").value = cookiePwd;
                document.getElementById("remember").checked = true;
            }

            // 新增：密码显示/隐藏切换逻辑（文字版）
            const pwdInput = document.getElementById("pwd");
            const togglePwdBtn = document.getElementById("togglePwd");
            let isPwdVisible = false; // 标记密码是否可见

            togglePwdBtn.addEventListener("click", function() {
                isPwdVisible = !isPwdVisible;
                // 切换密码输入框类型
                pwdInput.type = isPwdVisible ? "text" : "password";
                // 切换按钮文字（显示 ↔ 隐藏）
                togglePwdBtn.textContent = isPwdVisible ? "隐藏" : "显示";
            });

            // 监听表单提交事件，处理"记住密码"
            document.getElementById("loginForm").onsubmit = function() {
                const isRemember = document.getElementById("remember").checked;
                const sno = document.getElementById("sno").value;
                const pwd = document.getElementById("pwd").value;

                if (isRemember) {
                    // 勾选了"记住密码"，存储Cookie（7天有效期）
                    setCookie("rememberSno", sno, 7);
                    setCookie("rememberPwd", pwd, 7);
                } else {
                    // 未勾选，删除Cookie
                    deleteCookie("rememberSno");
                    deleteCookie("rememberPwd");
                }

                // 允许表单提交（跳转到loginStudent接口）
                return true;
            };
        };

        // 工具函数：设置Cookie
        function setCookie(name, value, days) {
            let expires = "";
            if (days) {
                const date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "")  + expires + "; path=/";
        }

        // 工具函数：读取Cookie
        function getCookie(name) {
            const value = "; " + document.cookie;
            const parts = value.split("; " + name + "=");
            if (parts.length === 2) return parts.pop().split(";").shift();
        }

        // 工具函数：删除Cookie
        function deleteCookie(name) {
            document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
        }
    </script>
</body>
</html>