<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>选课统计</title>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-image: url("img/loginbackground.png");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            font-family: "楷体", "Microsoft YaHei", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* 复刻统一毛玻璃容器样式 */
        .container {
            width: 600px;
            background-color: rgba(255, 255, 255, 0.5);
            padding: 60px 40px;
            border-radius: 64px;
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.7);
            text-align: center;
        }

        /* 复刻统一标题样式，保留原有文字 */
        .title {
            font-size: 22px;
            color: #800080;
            margin-bottom: 30px;
            padding-bottom: 8px;
            position: relative;
            font-weight: bold;
        }
        .title::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 2px;
            background-color: #800080;
        }

        /* 统一统计卡片样式：两个卡片大小完全一致 */
        .stat-card {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 12px;
            padding: 25px; /* 统一内边距 */
            text-align: center;
            margin-bottom: 25px; /* 统一间距 */
            box-shadow: 0 4px 12px rgba(128, 0, 128, 0.05);
            border: 1px solid #80008033;
            width: 100%; /* 强制宽度一致 */
            height: auto; /* 高度自适应且一致 */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .stat-icon {
            font-size: 40px;
            color: #800080;
            margin-bottom: 15px;
        }
        .stat-label {
            font-size: 18px;
            color: #800080;
            margin-bottom: 10px;
        }
        .stat-value {
            font-size: 36px;
            font-weight: bold;
            color: #800080;
        }

        /* 统一返回按钮样式 */
        .back-btn {
            text-align: center;
            margin-top: 20px;
        }
        .back-btn a {
            color: #800080;
            text-decoration: none;
            font-size: 14px;
            font-family: "楷体", sans-serif;
        }
        .back-btn a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">选课统计</div>
        
        <!-- 我的选课数 -->
        <div class="stat-card">
            <div class="stat-icon">
                <i class="fa fa-user"></i> <!-- 清理多余的<符号 -->
            </div>
            <div class="stat-label">我的选课数</div>
            <div class="stat-value">
                <%= request.getAttribute("myScCount") %>
            </div>
        </div>
        
        <!-- 总课程数：和我的选课数卡片大小完全一致 -->
        <div class="stat-card">
            <div class="stat-icon">
                <i class="fa fa-book"></i> <!-- 清理多余的<符号 -->
            </div>
            <div class="stat-label">总课程数</div>
            <div class="stat-value">
                <%= request.getAttribute("totalCourseCount") %>
            </div>
        </div>
        
        <div class="back-btn">
            <a href="toScChoose"><i class="fa fa-arrow-left"></i> 返回选课主页</a> <!-- 清理多余的<符号 -->
        </div>
    </div>
</body>
</html>