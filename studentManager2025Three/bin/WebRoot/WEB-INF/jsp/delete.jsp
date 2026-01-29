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

/* ✅ 统一背景+字体：完全保留 */
body {
    background-image: url("img/loginbackground.png");
    background-repeat: no-repeat; 
    background-size: cover; 
    background-position: center; 
    background-attachment: fixed;
    height: 100vh;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 15px; /* 缩小页面边距 */
}

/* ✅ 核心优化：容器宽度大幅缩小+内边距压缩，适配单屏 */
.operateBox {
    width: 420px; /* 从550px → 420px，大幅缩小核心宽度 */
    background-color: rgba(255, 255, 255, 0.4);
    padding: 20px 25px; /* 内边距从35/40 → 20/25，压缩占屏 */
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(128, 0, 128, 0.1);
    backdrop-filter: blur(5px);
    border: 1px solid rgba(255, 255, 255, 0.5);
}

/* ✅ 标题缩小字号+压缩间距，比例协调 */
h2 {
    color: #800080;
    text-align: center;
    font-size: 24px; /* 字号从28 →24，变小 */
    margin-bottom: 20px; /* 间距从30→20，压缩 */
    position: relative;
    padding-bottom: 8px;
}

h2::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px; /* 下划线缩短 */
    height: 2px;
    background-color: #800080;
}

/* ✅ 表单项压缩间距+缩小字号，整体更紧凑 */
.form-item {
    margin-bottom: 15px; /* 间距从22→15，大幅压缩 */
    position: relative;
}

span {
    font-family: "楷体", sans-serif;
    font-weight: bolder;
    color: #800080;
    font-size: 17px; /* 标签字号从19→17，变小 */
    display: inline-block;
    width: 90px; /* 标签宽度缩短 */
    vertical-align: middle;
    margin-bottom: 5px;
}

input {
    width: 100%;
    padding: 9px 12px; /* 输入框内边距从12/15→9/12，变矮 */
    border: 2px solid #800080;
    border-radius: 8px;
    font-size: 15px; /* 输入框字号从16→15 */
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
    font-size: 14px; /* 占位符字号缩小 */
}

/* ✅ 按钮组压缩间距+缩小按钮尺寸，适配小容器 */
.buttons {
    text-align: center;
    margin-top: 15px; /* 间距从25→15，压缩 */
    padding-top: 10px; /* 上内边距从15→10，压缩 */
    border-top: 1px solid rgba(128, 0, 128, 0.2);
}

input[type="submit"] {
    width: 120px; /* 按钮宽度从140→120，变小 */
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    padding: 8px 0; /* 按钮内边距从11→8，变矮 */
    border-radius: 8px;
    cursor: pointer;
    font-family: "楷体", sans-serif;
    font-size: 16px; /* 按钮字号从18→16，变小 */
    font-weight: bold;
    transition: all 0.3s ease;
    margin: 0 5px 10px; /* 按钮间距缩小 */
}

input[type="submit"]:hover {
    background-color: #800080;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(128, 0, 128, 0.2);
}

/* ✅ 错误提示缩小尺寸+间距，适配整体 */
.error-message {
    color: #dc3545;
    text-align: left;
    margin-top: 5px; /* 间距从8→5，压缩 */
    padding: 6px 10px; /* 内边距缩小 */
    border-radius: 6px;
    background-color: rgba(220, 53, 69, 0.1);
    font-size: 14px; /* 字号从16→14，变小 */
    font-family: "楷体", sans-serif;
    display: none;
    animation: fadeIn 0.5s ease;
}

/* ✅ 成功弹窗同步缩小，适配整体风格 */
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
    width: 320px; /* 弹窗宽度从380→320，变小 */
    background-color: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(8px);
    padding: 25px 20px; /* 弹窗内边距压缩 */
    border-radius: 16px;
    text-align: center;
    border: 1px solid rgba(255,255,255,0.8);
    box-shadow: 0 8px 25px rgba(128,0,128,0.2);
}

.modal-title {
    color: #28a745;
    font-size: 22px; /* 弹窗标题字号缩小 */
    font-family: "楷体", sans-serif;
    font-weight: bold;
    margin-bottom: 15px; /* 间距压缩 */
}

.modal-message {
    font-size: 17px; /* 弹窗文字字号缩小 */
    font-family: "楷体", sans-serif;
    color: #333;
    margin-bottom: 20px; /* 间距压缩 */
    line-height: 1.5;
}

#actionType {
    color: #800080;
    font-weight: bold;
}

.countdown {
    color: #800080;
    font-weight: bolder;
    font-size: 17px; /* 倒计时字号缩小 */
    font-family: "楷体", sans-serif;
}

/* ✅ 通用动画保留 */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* ✅ 响应式适配：适配更小屏幕 */
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

    <script type="text/javascript">
        // ✅ 表单验证逻辑：100%保留原有代码，无任何改动
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

            // 如果验证通过，记录操作类型（用于弹窗显示）
            if (isValid) {
                localStorage.setItem('actionType', isModify ? '修改' : '删除');
            }
            
            return isValid;
        }

        // ✅ 弹窗+倒计时跳转逻辑：100%保留原有代码，无任何改动
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