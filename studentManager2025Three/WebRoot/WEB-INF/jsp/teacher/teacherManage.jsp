<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>教师管理功能中心</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url("../img/loginbackground.png");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: "楷体", "Microsoft YaHei", sans-serif; /* 仅修改：优先楷体字体 */
        }
        .container {
            width: 800px;
            margin: 50px auto;
            background-color: rgba(255,255,255,0.4); /* 仅修改：降低透明度实现毛玻璃基底 */
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 8px 24px rgba(128, 0, 128, 0.1); /* 仅修改：阴影改为深紫色系 */
            backdrop-filter: blur(5px); /* 新增：毛玻璃模糊核心效果 */
            -webkit-backdrop-filter: blur(5px); /* 新增：兼容Safari浏览器 */
            border: 1px solid rgba(255,255,255,0.5); /* 新增：增强毛玻璃通透感 */
        }
        .title {
            text-align: center;
            color: #800080; /* 仅修改：主色改为深紫色 */
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 30px;
            border-bottom: 3px solid #800080; /* 仅修改：下划线改为深紫色 */
            padding-bottom: 10px;
        }
        .card-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 保留：原有2列布局不变 */
            gap: 25px; /* 保留：原有间距不变 */
        }
        .card {
            background-color: rgba(255,255,255,0.6); /* 仅修改：卡片改为半透明 */
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(128, 0, 128, 0.05); /* 仅修改：阴影改为深紫色系 */
            border: 2px solid #800080; /* 新增：卡片添加深紫色边框 */
            transition: all 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px); /* 保留：原有上移动画不变 */
            background-color: rgba(255,255,255,0.9); /* 仅修改：hover时加深卡片透明度 */
            box-shadow: 0 8px 20px rgba(128, 0, 128, 0.08); /* 仅修改：hover阴影改为深紫色系 */
        }
        .card i {
            font-size: 40px; /* 保留：原有图标尺寸不变 */
            color: #800080; /* 仅修改：图标改为深紫色 */
            margin-bottom: 15px; /* 保留：原有间距不变 */
        }
        .card h3 {
            font-size: 20px; /* 保留：原有标题尺寸不变 */
            color: #800080; /* 仅修改：标题改为深紫色 */
            margin-bottom: 15px; /* 保留：原有间距不变 */
        }
        .btn {
            background-color: #800080; /* 仅修改：按钮背景改为深紫色 */
            color: white;
            border: none;
            padding: 8px 20px; /* 保留：原有按钮尺寸不变 */
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px; /* 保留：原有按钮文字大小不变 */
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #6a0dad; /* 仅修改：hover时深紫色加深 */
        }
        .back-btn {
            text-align: center;
            margin-top: 30px; /* 保留：原有间距不变 */
        }
        .back-btn a {
            color: #800080; /* 仅修改：返回文字改为深紫色 */
            text-decoration: none;
            font-size: 16px; /* 保留：原有文字大小不变 */
        }
        .back-btn a:hover {
            text-decoration: underline; /* 保留：原有hover效果不变 */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">教师管理功能中心</div>
        <div class="card-grid">
            <!-- 新建教师功能卡片 -->
            <div class="card">
                <i class="fa fa-user-plus"></i>
                <h3>新建教师</h3>
                <button class="btn" onclick="window.location.href='toAddteacher'">进入操作</button>
            </div>
            <!-- 教师选课功能卡片 -->
            <div class="card">
                <i class="fa fa-book"></i>
                <h3>教师选课</h3>
                <button class="btn" onclick="window.location.href='toChooseCourse'">进入操作</button>
            </div>
            <!-- 修改教师信息功能卡片 -->
            <div class="card">
                <i class="fa fa-pencil-square-o"></i>
                <h3>修改教师信息</h3>
                <button class="btn" onclick="window.location.href='toUpdateTeacherCourse'">进入操作</button>
            </div>
            <!-- 查询功能卡片 -->
            <div class="card">
                <i class="fa fa-search"></i>
                <h3>查询</h3>
                <button class="btn" onclick="window.location.href='queryAllTeacher'">进入操作</button>
            </div>
        </div>
        <div class="back-btn">
            <a href="${pageContext.request.contextPath}/toMain"><i class="fa fa-arrow-left"></i> 返回首页</a>
        </div>
    </div>
</body>
</html>