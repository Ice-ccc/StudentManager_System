<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Teacher" %>
<%@ page import="com.pojo.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改教师授课课程</title>
<style type="text/css">
body {
    background-image: url("../img/loginbackground.png"); /* ✅ 替换为指定背景图 */
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    font-family: 楷体;
}
.container {
    width: 600px;
    margin: 0 auto;
    margin-top: 8%;
    background-color: rgba(255, 255, 255, 0.4); /* ✅ 毛玻璃核心：0.4半透 些许通透 */
    padding: 30px;
    border-radius: 16px; /* ✅ 统一项目圆角标准 */
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15); /* ✅ 深紫色柔影 强化质感 */
    border: 2px solid #800080; /* ✅ 紫色主边框 统一风格 */
    backdrop-filter: blur(8px); /* ✅ 毛玻璃模糊核心效果 */
    -webkit-backdrop-filter: blur(8px); /* ✅ 兼容所有浏览器 */
}
h2 {
    color: #800080; /* ✅ 统一深紫色主色调 */
    text-align: center;
    margin-bottom: 30px;
    font-weight: bold;
}
span {
    font-family: 楷体;
    font-weight: bolder;
    color: #800080; /* ✅ 标签统一深紫色 */
    font-size: 18px;
    display: inline-block;
    width: 120px;
}
input, select {
    margin-bottom: 20px;
    padding: 10px;
    width: 350px;
    border: 1px solid #ccc;
    border-radius: 6px; /* ✅ 统一圆角标准 */
    font-family: 楷体;
    font-size: 16px;
    color: #666;
    background-color: rgba(255,255,255,0.8); /* ✅ 输入框半透 适配毛玻璃 */
}
.tip {
    font-size: 14px;
    color: #666;
    margin-left: 125px;
    margin-top: -15px;
    margin-bottom: 20px;
    font-family: 楷体;
}
.buttons {
    margin-top: 20px;
    text-align: center;
}
input[type="submit"], input[type="button"], button {
    width: 140px;
    background-color: #800080; /* ✅ 按钮统一深紫色 */
    color: white;
    border: none;
    padding: 12px;
    border-radius: 6px; /* ✅ 统一圆角标准 */
    cursor: pointer;
    font-family: 楷体;
    font-size: 16px;
    margin: 0 5px;
    transition: all 0.35s ease; /* ✅ 丝滑hover过渡 */
}
input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #6a0dad; /* ✅ hover加深紫色 */
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}
/* 删除按钮样式（红色区分+保留hover效果） */
.btn-delete {
    background-color: #dc3545;
}
.btn-delete:hover {
    background-color: #c82333;
    box-shadow: 0 5px 12px rgba(220, 53, 69, 0.2);
}
.msg {
    text-align: center;
    font-size: 16px;
    color: red;
    margin-bottom: 20px;
    font-family: 楷体;
    padding: 10px;
    border-radius: 6px;
}
.success-msg {
    color: #28a745;
    background-color: rgba(212, 237, 218, 0.8); /* ✅ 成功提示半透适配 */
}
.query-box {
    border-bottom: 1px dashed rgba(128, 0, 128, 0.2); /* ✅ 分割线紫调半透 统一风格 */
    padding-bottom: 20px;
    margin-bottom: 20px;
}
/* 确认删除弹窗样式 - ✅ 适配毛玻璃风格，保留原有逻辑 */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    z-index: 999;
}
.modal-content {
    background-color: rgba(255,255,255,0.9); /* ✅ 弹窗半透 弱化生硬感 */
    width: 400px;
    margin: 20% auto;
    padding: 20px;
    border-radius: 12px; /* ✅ 圆角升级 更柔和 */
    text-align: center;
    font-family: 楷体;
    border: 1px solid rgba(128,0,128,0.1);
}
.modal-content p {
    font-size: 18px;
    margin-bottom: 20px;
    color: #333;
}
.modal-btn {
    width: 100px;
    border-radius: 6px;
}
</style>
</head>
<body>
    <div class="container">
        <h2>修改教师授课课程</h2>
        
        <%-- 显示提示信息（成功/失败） --%>
        <% String msg = (String) request.getAttribute("msg"); %>
        <% if (msg != null && !msg.isEmpty()) { %>
            <div class="msg <%= msg.contains("成功") ? "success-msg" : "" %>"><%= msg %></div>
        <% } %>

        <%
        // 获取后台传递的数据
        Teacher teacher = (Teacher) request.getAttribute("teacher");
        List<Course> allCourses = (List<Course>) request.getAttribute("allCourses");
        %>

        <%-- 第一步：输入教师编号查询 - ✅ action/路径完全未改 --%>
        <div class="query-box">
            <form action="toUpdateCourse" method="get">
                <span>教师编号：</span>
                <input type="number" name="Tno" placeholder="请输入要修改的教师编号" required>
                <div class="buttons" style="margin-top: 0;">
                    <input type="submit" value="查询教师">
                </div>
            </form>
        </div>

        <%-- 第二步：查询到教师后，显示修改+删除表单 - ✅ 所有路径/参数完全未改 --%>
        <% if (teacher != null) { %>
            <form action="doUpdateCourse" method="post" id="updateForm">
                <%-- 隐藏传递教师编号 --%>
                <input type="hidden" name="Tno" value="<%= teacher.getTno() %>" id="teacherId">
                
                <span>教师姓名：</span>
                <input type="text" value="<%= teacher.getTname() %>" readonly>
                <div class="tip">提示：教师姓名不可修改</div>

                <span>当前课程：</span>
                <input type="text" value="<%= teacher.getCno() == null ? "未分配课程" : teacher.getCno() %>" readonly>
                <div class="tip">提示：下方选择新的课程进行修改</div>

                <span>新授课课程：</span>
                <select name="Cno" required>
                    <option value="" disabled selected>请选择新的课程</option>
                    <% if (allCourses != null && !allCourses.isEmpty()) { %>
                        <% for (Course course : allCourses) { %>
                            <option value="<%= course.getCno() %>">
                                <%= course.getCno() %> - <%= course.getCname() %>（学分：<%= course.getCredit() %>）
                            </option>
                        <% } %>
                    <% } %>
                </select>

                <div class="buttons">
                    <input type="submit" value="确认修改课程"/>
                    <%-- 新增删除按钮 --%>
                    <button type="button" class="btn-delete" onclick="showDeleteModal()">删除该教师</button>
                    <input type="button" value="返回管理中心" onclick="location.href='toManageteacher'"/>
                </div>
            </form>
        <% } %>
    </div>

    <%-- 确认删除弹窗 - ✅ 弹窗结构/样式类名完全未改 --%>
    <div class="modal" id="deleteModal">
        <div class="modal-content">
            <p>确认要删除该教师吗？此操作不可恢复！</p>
            <button class="modal-btn btn-delete" onclick="deleteTeacher()">确认删除</button>
            <button class="modal-btn" onclick="hideDeleteModal()">取消</button>
        </div>
    </div>

    <script type="text/javascript">
        // 显示删除确认弹窗 - ✅ JS方法体一行未改
        function showDeleteModal() {
            document.getElementById("deleteModal").style.display = "block";
        }

        // 隐藏删除确认弹窗 - ✅ JS方法体一行未改
        function hideDeleteModal() {
            document.getElementById("deleteModal").style.display = "none";
        }

        // 执行删除操作 - ✅ 跳转路径/逻辑完全未改
        function deleteTeacher() {
            var tno = document.getElementById("teacherId").value;
            location.href = "delete/" + tno;
            hideDeleteModal();
        }

        // 点击弹窗外部关闭 - ✅ JS方法体一行未改
        window.onclick = function(event) {
            var modal = document.getElementById("deleteModal");
            if (event.target == modal) {
                hideDeleteModal();
            }
        }
    </script>
</body>
</html>