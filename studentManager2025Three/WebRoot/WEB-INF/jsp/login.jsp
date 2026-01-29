<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
<style type="text/css">
/* ✅ 页面整体：指定背景图 + 项目统一布局样式 */
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

/* ✅ 核心容器：毛玻璃紫色些许透明 + 统一圆角/阴影/边框 */
.login-container {
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

/* ✅ 左侧图片区：保留login图 + 适配毛玻璃风格 */
.illustration-area {
    flex: 1;
    height: 100%;
    background-image: url("${pageContext.request.contextPath}/img/login.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}

/* ✅ 右侧登录框：毛玻璃通透底色 + 统一内边距 */
.loginBox {
    flex: 1;
    padding: 40px 35px;
    background-color: rgba(255,255,255,0.4);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    display: flex;
    flex-direction: column;
    justify-content: center;
}

/* ✅ 标题：紫色主色调 + 加粗醒目 */
.loginBox h2 {
    text-align: center;
    margin: 0 0 30px 0;
    color: #800080;
    font-size: 26px;
    font-weight: bold;
}

/* ✅ 输入项样式：适配紫色风格 + 聚焦紫色边框 */
.form-item {
    margin-bottom: 22px;
    display: flex;
    align-items: center;
}
.form-item label {
    width: 70px;
    font-size: 16px;
    color: #333;
    font-weight: 500;
}
.pwd-input-wrapper {
    flex: 1;
    position: relative;
}
.form-item input {
    flex: 1;
    height: 42px;
    padding: 0 12px;
    border: 1px solid #dcdcdc;
    border-radius: 8px;
    outline: none;
    font-size: 16px;
    width: 100%;
    box-sizing: border-box;
    background-color: rgba(255,255,255,0.6);
}
/* ✅ 输入框聚焦：紫色高亮边框 */
.form-item input:focus {
    border-color: #800080;
    box-shadow: 0 0 0 2px rgba(128,0,128,0.1);
}

/* ✅ 密码显隐按钮：紫色配色 + hover加深 */
.toggle-pwd {
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    background: none;
    border: none;
    cursor: pointer;
    font-size: 14px;
    color: #800080;
    padding: 2px 8px;
    line-height: 1;
    font-family: "微软雅黑";
}
.toggle-pwd:hover {
    color: #6a0dad;
}

/* ✅ 忘记密码：紫色链接 + 统一hover效果 */
.forget-pwd {
    text-align: right;
    margin: -12px 0 20px 0;
}
.forget-pwd a {
    color: #800080;
    font-size: 14px;
    text-decoration: none;
}
.forget-pwd a:hover {
    text-decoration: underline;
    color: #6a0dad;
}

/* ✅ 记住密码：样式优化 */
.remember-pwd {
    margin-bottom: 25px;
    font-size: 14px;
    color: #333;
}
.remember-pwd input {
    width: 16px;
    height: 16px;
    margin-right: 8px;
}

/* ✅ 登录按钮：紫色主色 + hover渐变加深（和项目所有按钮统一） */
.submitBtn {
    width: 100%;
    height: 46px;
    background-color: #800080;
    color: #fff;
    border: none;
    border-radius: 8px;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}
.submitBtn:hover {
    background-color: #6a0dad;
}

/* ✅ 注册链接：紫色配色 + 统一交互 */
.register-link {
    text-align: center;
    margin-top: 15px;
    font-size: 14px;
    color: #333;
}
.register-link a {
    color: #800080;
    text-decoration: none;
    margin-left: 5px;
    font-weight: 500;
}
.register-link a:hover {
    text-decoration: underline;
    color: #6a0dad;
}
</style>
</head>
<body>
    <div class="login-container">
        <div class="loginBox">
            <h2>用户登录</h2>
            <form action="${pageContext.request.contextPath}/loginStudent" method="post" id="loginForm">
                <div class="form-item">
                    <label>学号：</label>
                    <input type="text" name="sno" id="sno" required/>
                </div>
                <div class="form-item">
                    <label>密码：</label>
                    <div class="pwd-input-wrapper">
                        <input type="password" name="pwd" id="pwd" required/>
                        <button type="button" class="toggle-pwd" id="togglePwd">显示</button>
                    </div>
                </div>
                
                <div class="forget-pwd">
                    <a href="${pageContext.request.contextPath}/toModifyPwd">忘记密码？</a>
                </div>
                
                <div class="remember-pwd">
                    <input type="checkbox" name="remember" id="remember"/>
                    <label for="remember">记住密码</label>
                </div>
                
                <input type="submit" value="登录" class="submitBtn"/>
                
                <div class="register-link">
                    还没有账号？<a href="${pageContext.request.contextPath}/toRegister">请先注册</a>
                </div>
            </form>
        </div>
        <div class="illustration-area"></div>
    </div>

    <script type="text/javascript">
        // 页面加载时，读取Cookie中的账号密码并填充
        window.onload = function() {
            const cookieSno = getCookie("rememberSno");
            const cookiePwd = getCookie("rememberPwd");
            
            if (cookieSno && cookiePwd) {
                document.getElementById("sno").value = cookieSno;
                document.getElementById("pwd").value = cookiePwd;
                document.getElementById("remember").checked = true;
            }

            // 密码显示/隐藏切换逻辑
            const pwdInput = document.getElementById("pwd");
            const togglePwdBtn = document.getElementById("togglePwd");
            let isPwdVisible = false;

            togglePwdBtn.addEventListener("click", function() {
                isPwdVisible = !isPwdVisible;
                pwdInput.type = isPwdVisible ? "text" : "password";
                togglePwdBtn.textContent = isPwdVisible ? "隐藏" : "显示";
            });

            // 记住密码Cookie处理
            document.getElementById("loginForm").onsubmit = function() {
                const isRemember = document.getElementById("remember").checked;
                const sno = document.getElementById("sno").value;
                const pwd = document.getElementById("pwd").value;

                if (isRemember) {
                    setCookie("rememberSno", sno, 7);
                    setCookie("rememberPwd", pwd, 7);
                } else {
                    deleteCookie("rememberSno");
                    deleteCookie("rememberPwd");
                }
                return true;
            };
        };

        // Cookie工具函数
        function setCookie(name, value, days) {
            let expires = "";
            if (days) {
                const date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "")  + expires + "; path=/";
        }
        function getCookie(name) {
            const value = "; " + document.cookie;
            const parts = value.split("; " + name + "=");
            if (parts.length === 2) return parts.pop().split(";").shift();
        }
        function deleteCookie(name) {
            document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
        }
    </script>
</body>
</html>