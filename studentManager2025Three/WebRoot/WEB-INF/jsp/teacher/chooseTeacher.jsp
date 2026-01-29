<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Teacher" %>
<%@ page import="com.pojo.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>教师课程分配</title>
<style type="text/css">
body {
    background-image: url("../img/loginbackground.png"); /* ✅ 更换为指定背景图 */
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
    background-color: rgba(255, 255, 255, 0.4); /* ✅ 0.4透明度 毛玻璃核心质感 */
    padding: 30px;
    border-radius: 16px; /* ✅ 项目统一16px圆角 */
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15); /* ✅ 深紫色柔影 */
    border: 2px solid #800080; /* ✅ 紫色主边框 统一风格 */
    backdrop-filter: blur(8px); /* ✅ 毛玻璃模糊核心效果 */
    -webkit-backdrop-filter: blur(8px); /* ✅ 兼容Safari浏览器 */
}
h2 {
    color: #800080; /* ✅ 统一深紫色主色调 */
    text-align: center;
    margin-bottom: 30px;
    font-size: 28px;
    font-weight: bold;
    padding-bottom: 12px;
    border-bottom: 2px solid #800080;
}
span {
    font-family: 楷体;
    font-weight: bolder;
    color: #800080; /* ✅ 标签文字统一深紫色 */
    font-size: 18px;
    display: inline-block;
    width: 120px;
}
select, input {
    margin-bottom: 20px;
    padding: 10px;
    width: 350px;
    border: 1px solid #ccc;
    border-radius: 6px; /* ✅ 统一6px圆角 */
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
input[type="submit"], input[type="button"] {
    width: 140px;
    background-color: #800080; /* ✅ 按钮统一深紫色 */
    color: white;
    border: none;
    padding: 12px;
    border-radius: 6px; /* ✅ 统一6px圆角 */
    cursor: pointer;
    font-family: 楷体;
    font-size: 16px;
    transition: all 0.35s ease; /* ✅ 丝滑hover过渡 */
}
input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #6a0dad; /* ✅ hover加深紫色 */
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2); /* ✅ 悬浮阴影提升质感 */
}
.empty-tip {
    text-align: center;
    color: #666;
    font-size: 18px;
    padding: 20px;
    font-family: 楷体;
}
</style>
</head>
<body>
    <div class="container">
        <h2>为教师分配授课课程</h2>

        <%
        // 获取后台传递的教师和课程数据 - 完全保留原有Java逻辑
        List<Teacher> noCourseTeachers = (List<Teacher>) request.getAttribute("noCourseTeachers");
        List<Course> allCourses = (List<Course>) request.getAttribute("allCourses");
        %>

        <%-- 无教师时显示提示 --%>
        <% if (noCourseTeachers == null || noCourseTeachers.isEmpty()) { %>
            <div class="empty-tip">暂无未分配课程的教师！</div>
            <div class="buttons">
                <input type="button" value="返回教师管理中心" onclick="location.href='toManageteacher'"/>
            </div>
        <% } else { %>
            <form action="assignCourseToTeacher" method="post">
                <span>选择教师：</span>
                <select name="Tno" required>
                    <option value="" disabled selected>请选择未分配课程的教师</option>
                    <% for (Teacher teacher : noCourseTeachers) { %>
                        <option value="<%= teacher.getTno() %>">
                            <%= teacher.getTno() %> - <%= teacher.getTname() %>（年龄：<%= teacher.getTage() == null ? "未填写" : teacher.getTage() %>）
                        </option>
                    <% } %>
                </select>
                <div class="tip">提示：仅显示未分配课程的教师</div>

                <span>分配课程：</span>
                <select name="Cno" required>
                    <option value="" disabled selected>请选择课程</option>
                    <% if (allCourses != null && !allCourses.isEmpty()) { %>
                        <% for (Course course : allCourses) { %>
                            <option value="<%= course.getCno() %>">
                                <%= course.getCno() %> - <%= course.getCname() %>（学分：<%= course.getCredit() %>）
                            </option>
                        <% } %>
                    <% } %>
                </select>
                <div class="tip">提示：课程列表来自已创建的课程数据</div>

                <div class="buttons">
                    <input type="submit" value="确认分配课程"/>
                    <input type="button" value="返回管理中心" onclick="location.href='toManageteacher'" style="margin-left: 20px;"/>
                </div>
            </form>
        <% } %>
    </div>
</body>
</html>