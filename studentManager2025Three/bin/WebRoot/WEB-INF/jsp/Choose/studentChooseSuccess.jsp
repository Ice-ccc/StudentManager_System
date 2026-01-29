<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>选课成功</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: "Microsoft YaHei", 楷体, sans-serif;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            background-color: rgba(255,255,255,0.4);
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
            text-align: center;
            border: 2px solid #800080;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
        }
        .success-icon {
            font-size: 60px;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .success-msg {
            font-size: 20px;
            font-weight: bold;
            color: #2d3748;
            margin-bottom: 30px;
        }
        .btn {
            background-color: #800080;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin: 0 10px;
            transition: all 0.35s ease;
        }
        .btn:hover {
            background-color: #6a0dad;
            box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon">
            <i class="fa fa-check-circle"></i>
        </div>
        <div class="success-msg">
            <%= request.getAttribute("successMsg") %>
        </div>
        <%-- ✅ 继续选课按钮 - 保留原样 --%>
        <button class="btn" onclick="window.location.href='${pageContext.request.contextPath}/toStudentChoose'">继续选课</button>
        <%-- ✅ 核心修改：返回选课主页 改为标准按钮，样式/路径/功能全部正确 --%>
        <button class="btn" onclick="window.location.href='${pageContext.request.contextPath}/toScChoose'">返回选课主页</button>
    </div>
</body>
</html>