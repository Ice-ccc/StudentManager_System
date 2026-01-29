<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
    <style type="text/css">
        /* 页面整体：替换为指定背景图 + 保留居中布局 + 统一字体 */
        body {
            background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
            background-repeat: no-repeat; 
            background-size: cover; 
            background-position: center; 
            background-attachment: fixed;
            margin: 0; 
            padding: 0; 
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "微软雅黑", "楷体", sans-serif;
        }

        /* ✅ 核心：毛玻璃紫色些许透明容器（和全站风格1:1一致） */
        .modifyPwdBox {
            width: 400px;
            background-color: rgba(255, 255, 255, 0.4);
            border-radius: 16px;
            padding: 30px 25px;
            box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border: 2px solid #800080;
        }

        /* ✅ 标题：全站统一紫色 + 加粗醒目（替换原浅蓝白） */
        .modifyPwdBox h2 {
            color: #800080;
            font-size: 26px;
            font-weight: bold;
            text-align: center;
            margin: 0 0 25px 0;
        }

        /* ✅ 输入项：紫色边框 + 通透底色 + 保留原有尺寸 */
        .form-item {
            margin-bottom: 18px;
        }
        .form-item input {
            width: 100%;
            height: 42px;
            border: 2px solid #800080;
            border-radius: 8px;
            padding: 0 15px;
            font-size: 14px;
            background-color: rgba(255,255,255,0.6);
            color: #333;
            box-sizing: border-box;
            transition: all 0.2s ease;
        }
        .form-item input:focus {
            outline: none;
            background-color: rgba(255,255,255,0.9);
            box-shadow: 0 0 0 3px rgba(128,0,128,0.2);
        }

        /* ✅ 按钮：紫色主色 + hover加深（全站统一交互） */
        .modifyPwdButton {
            width: 100%;
            height: 46px;
            border: none;
            border-radius: 8px;
            background-color: #800080;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.2s ease;
        }
        .modifyPwdButton:hover {
            background-color: #6a0dad;
        }

        /* 错误信息样式：保留原有样式，适配毛玻璃风格 */
        .errorMsg {
            color: #dc3545;
            font-size: 14px;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 500;
        }

        /* ✅ 成功弹窗：毛玻璃紫色通透风格 + 保留原有布局/按钮逻辑 */
        .success-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.3);
            backdrop-filter: blur(3px);
            justify-content: center;
            align-items: center;
            z-index: 999;
        }
        .modal-content {
            width: 350px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 16px;
            padding: 30px 20px;
            text-align: center;
            border: 2px solid #800080;
            box-shadow: 0 8px 20px rgba(128,0,128,0.15);
        }
        .modal-content h3 {
            color: #800080;
            font-size: 20px;
            font-weight: bold;
            margin: 0 0 20px 0;
        }
        .modal-buttons {
            display: flex;
            justify-content: space-around;
            margin-top: 25px;
        }
        .modal-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.2s ease;
        }
        .btn-stay {
            background-color: rgba(255,255,255,0.6);
            color: #800080;
            border: 2px solid #800080;
        }
        .btn-stay:hover {
            background-color: #800080;
            color: #fff;
        }
        .btn-login {
            background-color: #800080;
            color: #fff;
        }
        .btn-login:hover {
            background-color: #6a0dad;
        }
    </style>
</head>
<body>
    <div class="modifyPwdBox">
        <h2>MODIFY PWD</h2>
        <!-- ✅ 表单提交路径、参数 100%未改动 -->
        <form action="modifyPwd" method="post" id="modifyForm">
            <div class="form-item">
                <input type="text" name="snoStr" placeholder="学号" 
                       value="${loginSno}" required/>
            </div>
            <div class="form-item">
                <input type="text" name="newPwd" placeholder="新密码" required/>
            </div>
            <div class="form-item">
                <input type="text" name="renewPwd" placeholder="确认新密码" required/>
            </div>

            <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
            <% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
                <div class="errorMsg"><%= errorMsg %></div>
            <% } %>

            <input type="submit" value="修改密码" class="modifyPwdButton"/>
        </form>
    </div>

    <!-- 成功弹窗：布局未动，仅配色改版 -->
    <div class="success-modal" id="successModal">
        <div class="modal-content">
            <h3>修改密码成功！</h3>
            <div class="modal-buttons">
                <button class="modal-btn btn-stay" onclick="stayOnPage()">留在当前页面</button>
                <button class="modal-btn btn-login" onclick="goToLogin()">跳转到登录页面</button>
            </div>
        </div>
    </div>

    <!-- ✅ JS脚本：弹窗逻辑、跳转方法、表单重置 100%一行未改动 -->
    <script type="text/javascript">
        window.onload = function() {
            const isSuccess = <%= request.getAttribute("modifySuccess") != null ? "true" : "false" %>;
            if (isSuccess) {
                document.getElementById("successModal").style.display = "flex";
            }
        }

        function stayOnPage() {
            document.getElementById("successModal").style.display = "none";
            document.getElementById("modifyForm").reset();
        }

        function goToLogin() {
            window.location.href = "toLogin";
        }
    </script>
</body>
</html>