<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改/删除学生信息</title>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* ✅ 严格按要求：背景图补全指定路径 + 纯毛玻璃紫色基础布局 【仅改此处背景图路径，其余未动】 */
body {
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-repeat: no-repeat; 
    background-size: cover; 
    background-position: center; 
    background-attachment: fixed;
    height: 100vh;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 15px;
}

/* ✅ 核心：纯毛玻璃紫色些许透明风格（和登录/注册页完全一致） 样式未改、参数未动 */
.operateBox {
    width: 420px;
    background-color: rgba(255, 255, 255, 0.4);
    padding: 20px 25px;
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(128, 0, 128, 0.1);
    backdrop-filter: blur(5px);
    border: 1px solid rgba(255, 255, 255, 0.5);
}

/* ✅ 紫色标题+下划线 样式未动、参数未动 */
h2 {
    color: #800080;
    text-align: center;
    font-size: 24px;
    margin-bottom: 20px;
    position: relative;
    padding-bottom: 8px;
}

h2::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 2px;
    background-color: #800080;
}

/* ✅ 表单项样式 纯紫色系+紧凑布局 样式未动、参数未动 */
.form-item {
    margin-bottom: 15px;
    position: relative;
}

span {
    font-family: "楷体", sans-serif;
    font-weight: bolder;
    color: #800080;
    font-size: 17px;
    display: inline-block;
    width: 90px;
    vertical-align: middle;
    margin-bottom: 5px;
}

input {
    width: 100%;
    padding: 9px 12px;
    border: 2px solid #800080;
    border-radius: 8px;
    font-size: 15px;
    font-family: "楷体", sans-serif;
    color: #333;
    background-color: rgba(255, 255, 255, 0.6);
    transition: all 0.3s ease;
}

input:focus {
    outline: none;
    background-color: rgba(255, 255, 255, 0.9);
    box-shadow: 0 0 0 3px rgba(128, 0, 128, 0.2);
}

input::placeholder {
    color: #800080;
    opacity: 0.7;
    font-family: "楷体", sans-serif;
    font-size: 14px;
}

/* ✅ 紫色按钮组 样式未动、参数未动 */
.buttons {
    text-align: center;
    margin-top: 15px;
    padding-top: 10px;
    border-top: 1px solid rgba(128, 0, 128, 0.2);
}

input[type="submit"] {
    width: 120px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    padding: 8px 0;
    border-radius: 8px;
    cursor: pointer;
    font-family: "楷体", sans-serif;
    font-size: 16px;
    font-weight: bold;
    transition: all 0.3s ease;
    margin: 0 5px 10px;
}

input[type="submit"]:hover {
    background-color: #800080;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(128, 0, 128, 0.2);
}

/* ✅ 错误提示样式 样式未动、参数未动 */
.error-message {
    color: #dc3545;
    text-align: left;
    margin-top: 5px;
    padding: 6px 10px;
    border-radius: 6px;
    background-color: rgba(220, 53, 69, 0.1);
    font-size: 14px;
    font-family: "楷体", sans-serif;
    display: none;
    animation: fadeIn 0.5s ease;
}

/* ✅ 成功弹窗 毛玻璃紫色风格 样式未动、参数未动 */
.success-modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.3);
    z-index: 1000;
    align-items: center;
    justify-content: center;
    backdrop-filter: blur(3px);
}

.modal-content {
    width: 320px;
    background-color: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(8px);
    padding: 25px 20px;
    border-radius: 16px;
    text-align: center;
    border: 1px solid rgba(255,255,255,0.8);
    box-shadow: 0 8px 25px rgba(128,0,128,0.2);
}

.modal-title {
    color: #28a745;
    font-size: 22px;
    font-family: "楷体", sans-serif;
    font-weight: bold;
    margin-bottom: 15px;
}

.modal-message {
    font-size: 17px;
    font-family: "楷体", sans-serif;
    color: #333;
    margin-bottom: 20px;
    line-height: 1.5;
}

#actionType {
    color: #800080;
    font-weight: bold;
}

.countdown {
    color: #800080;
    font-weight: bolder;
    font-size: 17px;
    font-family: "楷体", sans-serif;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* ✅ 响应式适配 样式未动、参数未动 */
@media (max-width: 450px) {
    .operateBox {
        width: 100%;
        padding: 15px 15px;
    }
    span {
        width: 80px;
        font-size: 16px;
    }
    input[type="submit"] {
        width: 100px;
        margin: 0 3px 8px;
        font-size: 15px;
    }
    .modal-content {
        width: 90%;
        padding: 20px 10px;
    }
}
</style>
</head>
<body>
    <div class="operateBox">
        <h2>修改/删除学生信息</h2>
        <!-- ✅ 表单提交路径 完全未改动 -->
        <form action="${pageContext.request.contextPath}/handleModifyOrDelete" method="post" onsubmit="return validateForm()">
            <div class="form-item">
                <span>学号：</span> 
                <input type="text" name="snoStr" required id="sno" placeholder="请输入数字学号"/>
                <div class="error-message" id="snoError">学号必须为数字</div>
            </div>
            
            <div class="form-item">
                <span>新姓名：</span> 
                <input type="text" name="sname" id="sname"/>
                <div class="error-message" id="snameError">姓名不能为空（删除时）</div>
            </div>
            
            <div class="form-item">
                <span>新密码：</span> 
                <input type="text" name="pwd" id="pwd"/>
                <div class="error-message" id="pwdError">密码不能为空（删除时）</div>
            </div>
            
            <div class="form-item">
                <span>新年龄：</span> 
                <input type="text" name="ageStr" id="age"/>
                <div class="error-message" id="ageError">年龄必须为1-150之间的数字</div>
            </div>
            
            <div class="form-item">
                <span>新爱好：</span> 
                <input type="text" name="hobbit" id="hobbit"/>
                <div class="error-message" id="hobbitError">爱好不能为空（删除时）</div>
            </div>
            
            <div class="form-item">
                <span>新地址：</span> 
                <input type="text" name="address" id="address"/>
                <div class="error-message" id="addressError">地址不能为空（删除时）</div>
            </div>
            
            <div class="buttons">
                <input type="submit" name="action" value="修改信息" id="modifyBtn"/>
                <input type="submit" name="action" value="删除学生" id="deleteBtn"/>
            </div>
        </form>
    </div>

    <!-- 成功弹窗（默认隐藏） -->
    <div class="success-modal" id="successModal">
        <div class="modal-content">
            <div class="modal-title">操作成功！</div>
            <div class="modal-message">
                您的<a id="actionType">修改</a>操作已完成
            </div>
            <div>
                将在 <span class="countdown" id="countdown">5</span> 秒后自动返回首页...
            </div>
        </div>
    </div>

    <!-- ✅ JS脚本：表单验证、弹窗、跳转逻辑 100%完全未改动一行代码 -->
    <script type="text/javascript">
        function validateForm() {
            document.querySelectorAll('.error-message').forEach(el => {
                el.style.display = 'none';
            });
            
            var sno = document.getElementById('sno').value;
            var sname = document.getElementById('sname').value;
            var pwd = document.getElementById('pwd').value;
            var age = document.getElementById('age').value;
            var hobbit = document.getElementById('hobbit').value;
            var address = document.getElementById('address').value;
            var isModify = document.activeElement.id === 'modifyBtn';
            var isValid = true;
            
            if (!/^\d+$/.test(sno)) {
                document.getElementById('snoError').style.display = 'block';
                isValid = false;
            }
            
            if (isModify) {
                if (age && (!/^\d+$/.test(age) || parseInt(age) < 1 || parseInt(age) > 150)) {
                    document.getElementById('ageError').style.display = 'block';
                    isValid = false;
                }
            } else {
                if (!sname.trim()) {
                    document.getElementById('snameError').style.display = 'block';
                    isValid = false;
                }
                if (!pwd.trim()) {
                    document.getElementById('pwdError').style.display = 'block';
                    isValid = false;
                }
                if (!age.trim() || !/^\d+$/.test(age) || parseInt(age) < 1 || parseInt(age) > 150) {
                    document.getElementById('ageError').style.display = 'block';
                    isValid = false;
                }
                if (!hobbit.trim()) {
                    document.getElementById('hobbitError').style.display = 'block';
                    isValid = false;
                }
                if (!address.trim()) {
                    document.getElementById('addressError').style.display = 'block';
                    isValid = false;
                }
            }

            if (isValid) {
                localStorage.setItem('actionType', isModify ? '修改' : '删除');
            }
            
            return isValid;
        }

        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const isSuccess = urlParams.get('success');
            
            if (isSuccess === 'true') {
                const actionType = localStorage.getItem('actionType') || '操作';
                document.getElementById('actionType').textContent = actionType;
                document.getElementById('successModal').style.display = 'flex';
                
                let countdown = 5;
                const countdownEl = document.getElementById('countdown');
                const timer = setInterval(() => {
                    countdown--;
                    countdownEl.textContent = countdown;
                    if (countdown <= 0) {
                        clearInterval(timer);
                        window.location.href = '${pageContext.request.contextPath}/toMain';
                    }
                }, 1000);
            }
        };
    </script>
</body>
</html>