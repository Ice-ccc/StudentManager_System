<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>查看学生信息</title>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background-image: url("img/loginbackground.png"); /* 这里是你的背景图路径 */
    background-repeat: no-repeat; 
    background-size: cover; 
    background-position: center; 
    background-attachment: fixed;
    height: 100vh;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
}

/* 容器改为透明（透出背景图） */
.container {
    width: 550px;
    background-color: rgba(255, 255, 255, 0.4); /* 降低不透明度，更透明 */
    padding: 35px 40px;
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(128, 0, 128, 0.1); /* 弱化阴影 */
    backdrop-filter: blur(5px); /* 轻微模糊，保留通透感 */
    border: 1px solid rgba(255, 255, 255, 0.5); /* 更浅的边框 */
}

h2 {
    color: #800080;
    text-align: center;
    font-size: 28px;
    margin-bottom: 25px;
    position: relative;
    padding-bottom: 10px;
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

.form-group {
    margin-bottom: 25px;
    position: relative;
}

span {
    font-family: "楷体", sans-serif;
    font-weight: bolder;
    color: #800080;
    font-size: 19px;
    display: inline-block;
    width: 80px;
    vertical-align: middle;
    margin-bottom: 8px;
}

input[type="text"] {
    width: 100%; /* 输入框占满容器宽度 */
    padding: 12px 15px;
    border: 2px solid #800080; /* 紫色边框 */
    border-radius: 8px;
    font-size: 16px;
    font-family: "楷体", sans-serif;
    color: #333;
    background-color: rgba(255, 255, 255, 0.6); /* 输入框半透明 */
    transition: all 0.3s ease;
}

input[type="text"]:focus {
    outline: none;
    background-color: rgba(255, 255, 255, 0.9); /* 焦点时更不透明 */
    box-shadow: 0 0 0 3px rgba(128, 0, 128, 0.2);
}

input[type="text"]::placeholder {
    color: #800080;
    opacity: 0.7;
    font-family: "楷体", sans-serif;
    font-size: 15px;
}

.form-divider {
    height: 1px;
    background-color: rgba(128, 0, 128, 0.2); /* 淡紫色分隔线 */
    margin: 25px 0;
    position: relative;
}

.form-divider::after {
    content: "其他查询方式";
    position: absolute;
    left: 50%;
    top: -12px;
    transform: translateX(-50%);
    background-color: transparent; /* 分隔线文字背景透明 */
    padding: 0 15px;
    color: #800080;
    font-size: 16px;
    font-weight: bold;
    letter-spacing: 1px;
}

.buttons {
    margin-top: 15px;
    text-align: center;
}

/* 按钮样式（与页面风格统一） */
input[type="submit"], input[type="button"] {
    width: 140px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    padding: 11px 0;
    border-radius: 8px;
    cursor: pointer;
    font-family: "楷体", sans-serif;
    font-size: 18px;
    font-weight: bold;
    transition: all 0.3s ease;
    margin: 0 8px 15px;
}

input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #800080;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(128, 0, 128, 0.2);
}

.errorMsg, .fuzzy-errorMsg {
    color: #dc3545;
    text-align: center;
    font-size: 16px;
    margin-top: 8px;
    padding: 8px 12px;
    border-radius: 6px;
    background-color: rgba(220, 53, 69, 0.1);
    animation: fadeIn 0.5s ease;
}

.common-buttons {
    margin-top: 20px;
    padding-top: 15px;
    border-top: 1px solid rgba(128, 0, 128, 0.2);
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

@media (max-width: 576px) {
    .container {
        width: 100%;
        padding: 25px 20px;
    }
    
    span {
        width: 100%;
        text-align: left;
    }
    
    input[type="text"] {
        width: 100%;
    }
}
</style>
</head>
<body>
    <div class="container">
        <h2>查看学生信息</h2>
        
        <!-- 按学号查询表单 -->
        <form action="checkStudent" method="post" id="snoQueryForm">
            <div class="form-group">
                <span>学号：</span>
                <input type="text" name="sno" required placeholder="请输入数字学号"/>
            </div>
            
            <% String snoErrorMsg = (String) request.getAttribute("snoErrorMsg"); %>
            <% if (snoErrorMsg != null && !snoErrorMsg.trim().isEmpty()) { %>
                <div class="errorMsg"><%= snoErrorMsg %></div>
            <% } %>
            
            <div class="buttons">
                <input type="submit" value="按学号查询"/>
            </div>
        </form>
        
        <div class="form-divider"></div>
        
        <!-- 按姓名查询表单 -->
        <form action="fuzzyQueryStudent" method="post" id="snameQueryForm">
            <div class="form-group">
                <span>姓名：</span>
                <input type="text" name="sname" required placeholder="请输入姓名关键词（模糊匹配）"/>
            </div>
            
            <% String snameErrorMsg = (String) request.getAttribute("snameErrorMsg"); %>
            <% if (snameErrorMsg != null && !snameErrorMsg.trim().isEmpty()) { %>
                <div class="fuzzy-errorMsg"><%= snameErrorMsg %></div>
            <% } %>
            
            <div class="buttons">
                <input type="submit" value="模糊查询"/>
            </div>
        </form>
        
        <div class="buttons common-buttons">
            <input type="button" value="查询所有学生" onclick="location.href='showAllStudents'"/>
            <input type="button" value="返回首页" onclick="location.href='toMain'"/>
        </div>
    </div>
</body>
</html>