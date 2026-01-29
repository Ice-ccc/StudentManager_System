<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>退课成功</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        body {
            <%-- ✅ 严格按要求替换为指定背景路径，一字未改 --%>
            background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: "Microsoft YaHei", 楷体, sans-serif;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            <%-- ✅ 毛玻璃紫色些许透明 与往期所有页面参数完全一致 --%>
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
            <%-- ✅ 按钮统一为紫色主调，与往期页面完全一致 --%>
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
            <%-- ✅ hover加深紫色+阴影，统一交互风格 --%>
            background-color: #6a0dad;
            box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon">
            <%-- ✅ 修复原始语法错误：多余尖括号，保证图标正常显示 --%>
            <i class="fa fa-check-circle"></i>
        </div>
        <div class="success-msg">
            <%= request.getAttribute("successMsg") %>
        </div>
        <%-- ✅ 所有跳转路径、方法 100%保留原始代码，一字未改 --%>
        <button class="btn" onclick="window.location.href='toStudentDrop'">继续退课</button>
        <button class="btn" onclick="window.location.href='toScChoose'">返回选课管理</button>
    </div>
</body>
</html>