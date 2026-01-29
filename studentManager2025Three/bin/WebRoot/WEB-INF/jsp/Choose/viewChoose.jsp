<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Course" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查看选课</title>
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

        /* 复刻统一样式：毛玻璃容器 */
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

        /* 复刻统一样式：标题 */
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

        /* 保留原有表格样式，仅修改文字颜色为深紫色 */
        .table-container {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #80008033; /* 浅紫色边框 */
            color: #800080; /* 深紫色文字 */
        }
        th {
            background-color: rgba(255, 255, 255, 0.8);
            font-weight: bold;
        }
        tr:hover {
            background-color: rgba(255, 255, 255, 0.9);
        }
        .no-data {
            text-align: center;
            padding: 30px;
            color: #800080; /* 深紫色文字 */
            font-size: 18px;
        }

        /* 复刻统一样式：返回按钮 */
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
        <div class="title">我的已选课程</div> <!-- 保留原有文字 -->
        <div class="table-container">
            <% 
                // 保留原有功能逻辑
                List<Course> selectedCourses = (List<Course>) request.getAttribute("selectedCourses");
                if (selectedCourses != null && !selectedCourses.isEmpty()) {
            %>
                <table>
                    <tr>
                        <th>课程编号</th>
                        <th>课程名称</th>
                        <th>学分</th>
                        <th>课程描述</th>
                    </tr>
                    <% 
                        for (Course course : selectedCourses) {
                    %>
                        <tr>
                            <td><%= course.getCno() %></td>
                            <td><%= course.getCname() %></td>
                            <td><%= course.getCredit() %></td>
                            <td><%= course.getComment() != null ? course.getComment() : "无" %></td>
                        </tr>
                    <% 
                        }
                    %>
                </table>
            <% 
                } else {
            %>
                <div class="no-data">
                    <i class="fa fa-info-circle"></i> 你暂无已选课程
                </div>
            <% 
                }
            %>
        </div>
        <div class="back-btn">
            <!-- 仅修改：文字改为“返回选课主页”，跳转改为toScChoose -->
            <a href="toScChoose"><i class="fa fa-arrow-left"></i> 返回选课主页</a>
        </div>
    </div>
</body>
</html>