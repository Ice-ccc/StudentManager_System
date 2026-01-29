<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Course" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生退课</title>
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

        /* 容器：复刻选课页样式 */
        .container {
            width: 800px;
            background-color: rgba(255, 255, 255, 0.5);
            padding: 60px 40px;
            border-radius: 64px;
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.7);
            text-align: center;
        }

        /* 标题：复刻选课页样式，文字保留“学生退课” */
        .title {
            font-size: 22px;
            color: #800080;
            margin-bottom: 25px;
            padding-bottom: 8px;
            position: relative;
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

        /* 表单组：复刻选课页样式 */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 16px;
            color: #800080;
        }

        /* 选择框：复刻选课页样式 */
        .form-group select {
            width: 100%;
            padding: 10px 12px;
            background-color: rgba(255, 255, 255, 0.8);
            border: 2px solid #800080;
            border-radius: 8px;
            font-family: "楷体", sans-serif;
            font-size: 16px;
            color: #800080;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%23800080' viewBox='0 0 16 16'%3E%3Cpath d='M8 11l4-4H4l4 4z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
        }

        /* 确认按钮：复刻选课页样式，文字保留“确认退课” */
        .confirm-btn {
            width: 100%;
            background-color: #800080;
            color: white;
            border: none;
            padding: 10px 0;
            border-radius: 8px;
            cursor: pointer;
            font-family: "楷体", sans-serif;
            font-size: 16px;
            margin-bottom: 15px;
        }

        /* 返回按钮：复刻选课页样式，文字和跳转按选课页修改 */
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
        <div class="title">学生退课</div> <!-- 保留退课页文字 -->
        <form action="studentDrop" method="post"> <!-- 保留退课页接口 -->
            <div class="form-group">
                <label for="cno">选择已选课程：</label> <!-- 保留退课页文字 -->
                <select name="cno" id="cno" required>
                    <option value="">-- 请选择要退的课程 --</option> <!-- 保留退课页文字 -->
                    <% 
                        // 保留退课页原有逻辑
                        List<Course> selectedCourses = (List<Course>) request.getAttribute("selectedCourses");
                        if (selectedCourses != null && !selectedCourses.isEmpty()) {
                            for (Course course : selectedCourses) {
                    %>
                        <option value="<%= course.getCno() %>">
                            <%= course.getCno() %> - <%= course.getCname() %>（学分：<%= course.getCredit() %>）
                        </option>
                    <% 
                            }
                        } else {
                    %>
                        <option value="" disabled>你暂无已选课程</option> <!-- 保留退课页文字 -->
                    <% 
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="confirm-btn">确认退课</button> <!-- 保留退课页文字 -->
        </form>
        <div class="back-btn">
            <!-- 仅修改这里：文字改为“返回选课主页”，跳转改为toScChoose（和选课页一致） -->
            <a href="toScChoose"><i class="fa fa-arrow-left"></i> 返回选课主页</a>
        </div>
    </div>
</body>
</html>