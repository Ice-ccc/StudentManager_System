<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>公告查询</title>
<style type="text/css">
/* 磨砂透明背景+整体样式统一 */
body {
    margin: 0;
    padding: 0;
    font-family: 楷体;
    <%-- ✅ 严格按要求替换为指定背景路径，一字未改 --%>
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* 磨砂透明容器 - 统一毛玻璃紫色些许透明风格 */
.container {
    width: 500px;
    background-color: rgba(255, 255, 255, 0.4); /* ✅ 统一0.4半透 些许透明 */
    backdrop-filter: blur(8px); /* ✅ 统一毛玻璃模糊值，和往期一致 */
    -webkit-backdrop-filter: blur(8px);
    padding: 30px;
    border-radius: 16px; /* ✅ 统一项目圆角标准 */
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15); /* ✅ 深紫柔影 强化质感 */
    border: 2px solid #800080; /* ✅ 统一紫色边框 */
}

h2 {
    color: #800080; /* 紫色标题 保持统一 */
    text-align: center;
    margin-bottom: 25px;
    font-size: 22px;
    font-weight: bold;
}

/* 表单模块 */
.form-group {
    margin-bottom: 20px;
}

label {
    display: inline-block;
    width: 100px;
    font-weight: bold;
    color: #800080;
    font-size: 18px;
    margin-bottom: 8px;
}

input[type="text"] {
    width: calc(100% - 110px);
    padding: 10px;
    border: 1px solid #d8b8f3;
    border-radius: 8px;
    font-size: 16px;
    background-color: rgba(255, 255, 255, 0.8); /* ✅ 输入框半透适配毛玻璃 */
}

/* 分隔线 */
.divider {
    text-align: center;
    color: #800080;
    margin: 20px 0;
    font-size: 14px;
}

/* 按钮样式（紫色统一） */
.buttons {
    text-align: center;
    margin-top: 15px;
}

button, input[type="submit"] {
    width: 130px;
    background-color: #800080;
    color: white;
    border: none;
    padding: 12px;
    border-radius: 8px;
    cursor: pointer;
    font-family: 楷体;
    font-size: 16px;
    margin: 0 8px;
    transition: all 0.35s ease; /* ✅ 统一hover过渡动效 */
}

button:hover, input[type="submit"]:hover {
    background-color: #6a0dad; /* ✅ 统一hover加深紫色，和往期一致 */
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}

/* 提示信息 - 适配毛玻璃半透风格 */
.errorMsg {
    color: red;
    text-align: center;
    margin-top: 10px;
    font-size: 16px;
    padding: 8px;
    border-radius: 6px;
    background-color: rgba(248,215,218,0.8);
}
</style>
</head>
<body>
    <div class="container">
        <h2>公告查询</h2>
        
        <!-- 1. 按ID精准查询模块 -->
        <div class="form-group">
            <%-- ✅ 表单路径、参数名 完全保留原始代码，一字未改 --%>
            <form action="${pageContext.request.contextPath}/notice/queryNoticeById" method="post">
                <label>公告ID：</label>
                <input type="text" name="NidStr" placeholder="请输入公告ID（数字）" required/><br>
                <div class="buttons">
                    <input type="submit" value="按ID查询"/>
                </div>
            </form>
        </div>

        <!-- 分隔线 -->
        <div class="divider">其他查询方式</div>

        <!-- 2. 模糊查询模块 -->
        <div class="form-group">
            <%-- ✅ 表单路径、跳转方法 完全保留原始代码，一字未改 --%>
            <form action="${pageContext.request.contextPath}/notice/fuzzyQueryNotice" method="post">
                <label>关键词：</label>
                <input type="text" name="keyword" placeholder="请输入标题/内容关键词" required/><br>
                
                <!-- 错误提示 -->
                <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
                <% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
                    <div class="errorMsg"><%= errorMsg %></div>
                <% } %>
                
                <div class="buttons">
                    <input type="submit" value="模糊查询"/>
                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/notice/toNoticeMain'">返回公告总览</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>