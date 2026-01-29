<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
    <style type="text/css">
        /* 页面整体：背景图+居中布局 */
        body {
            background-image: url("img/77.jpg");
            background-repeat: no-repeat; 
            background-size: cover; 
            background-position: center; 
            margin: 0; 
            padding: 0; 
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "微软雅黑", sans-serif;
        }

        /* 修改密码容器：匹配示例图样式 */
        .modifyPwdBox {
            width: 400px;
            background-color: #d6e6f9; /* 浅蓝紫背景，匹配注册页风格 */
            border-radius: 15px;
            padding: 30px 25px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        /* 标题样式 */
        .modifyPwdBox h2 {
            color: #fff;
            font-size: 26px;
            font-weight: bold;
            text-align: center;
            margin: 0 0 25px 0;
        }

        /* 输入项样式：匹配示例图的圆角输入框 */
        .form-item {
            margin-bottom: 18px;
        }
        .form-item input {
            width: 100%;
            height: 42px;
            border: none;
            border-radius: 8px;
            padding: 0 15px;
            font-size: 14px;
            background-color: rgba(255,255,255,0.8);
            color: #333;
            box-sizing: border-box;
        }
        .form-item input:focus {
            outline: none;
            background-color: #fff;
        }

        /* 修改密码按钮样式 */
        .modifyPwdButton {
            width: 100%;
            height: 46px;
            border: none;
            border-radius: 8px;
            background-color: #fff;
            color: #d6e6f9;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.2s;
        }
        .modifyPwdButton:hover {
            background-color: #f0f0f0;
        }

        /* 错误信息样式 */
        .errorMsg {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-bottom: 15px;
        }

        /* 成功弹窗样式（默认隐藏） */
        .success-modal {
            display: none; /* 默认隐藏 */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
            z-index: 999;
        }
        .modal-content {
            width: 350px;
            background-color: #fff;
            border-radius: 12px;
            padding: 30px 20px;
            text-align: center;
        }
        .modal-content h3 {
            color: #333;
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
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        }
        .btn-stay {
            background-color: #d6e6f9;
            color: #fff;
        }
        .btn-login {
            background-color: #ffb800;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="modifyPwdBox">
        <h2>MODIFY PWD</h2>
        <form action="modifyPwd" method="post" id="modifyForm">
            <!-- 学号输入项：已登录时自动填充 -->
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

            <!-- 错误信息显示 -->
            <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
            <% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
                <div class="errorMsg"><%= errorMsg %></div>
            <% } %>

            <input type="submit" value="修改密码" class="modifyPwdButton"/>
        </form>
    </div>

    <!-- 成功弹窗（默认隐藏） -->
    <div class="success-modal" id="successModal">
        <div class="modal-content">
            <h3>修改密码成功！</h3>
            <div class="modal-buttons">
                <button class="modal-btn btn-stay" onclick="stayOnPage()">留在当前页面</button>
                <button class="modal-btn btn-login" onclick="goToLogin()">跳转到登录页面</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        // 页面加载时，判断是否需要显示成功弹窗
        window.onload = function() {
            // 后端传递的success标记（修改成功时会设置）
            const isSuccess = <%= request.getAttribute("modifySuccess") != null ? "true" : "false" %>;
            if (isSuccess) {
                // 显示成功弹窗
                document.getElementById("successModal").style.display = "flex";
            }
        }

        // 留在当前页面：关闭弹窗，清空表单
        function stayOnPage() {
            document.getElementById("successModal").style.display = "none";
            document.getElementById("modifyForm").reset();
        }

        // 跳转到登录页面
        function goToLogin() {
            window.location.href = "toLogin"; // 替换为你的登录页路径
        }
    </script>
</body>
</html>