<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Teacher" %>
<%@ page import="com.pojo.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>教师信息查询</title>
<style type="text/css">
/* 全局样式 - 毛玻璃紫色些许透明 + 指定背景图【核心保留】 */
body {
    background-image: url("../img/loginbackground.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    font-family: 楷体;
}
.container {
    width: 90%;
    max-width: 1200px;
    margin: 50px auto;
    background-color: rgba(255, 255, 255, 0.4); /* 主容器通透感保留 */
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 8px 32px rgba(128, 0, 128, 0.12); /* 柔化阴影，更高级 */
    border: 2px solid rgba(128, 0, 128, 0.2); /* 边框半透，弱化突兀感 */
    backdrop-filter: blur(12px); /* 模糊升级，毛玻璃更丝滑 */
    -webkit-backdrop-filter: blur(12px);
}
h2 {
    color: #800080;
    text-align: center;
    margin-bottom: 30px;
    border-bottom: 2px solid rgba(128, 0, 128, 0.1); /* 边框半透渐变 */
    padding-bottom: 10px;
    font-weight: bold;
}

/* 查询表单样式 - 柔和半透+无生硬色块【优化重点】 */
.query-form {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
    gap: 10px;
    flex-wrap: wrap;
}
.query-form span {
    font-family: 楷体;
    font-weight: bolder;
    color: #800080;
    font-size: 18px;
}
.query-form input {
    padding: 8px 10px;
    width: 200px;
    border: 1px solid rgba(128, 0, 128, 0.15); /* 边框紫调，统一风格 */
    border-radius: 8px; /* 圆角升级，更柔和 */
    font-family: 楷体;
    font-size: 16px;
    background-color: rgba(255,255,255,0.65); /* 降低不透明度，通透不突兀 */
    color: #333;
    transition: all 0.3s ease;
}
.query-form input:focus {
    outline: none;
    border-color: #800080;
    background-color: rgba(255,255,255,0.8); /* 聚焦微加深，提升交互 */
    box-shadow: 0 0 8px rgba(128,0,128,0.1);
}
.query-form button {
    padding: 8px 20px;
    background-color: #800080;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-family: 楷体;
    font-size: 16px;
    transition: all 0.35s ease;
}
.query-form button:hover {
    background-color: #6a0dad;
    box-shadow: 0 5px 15px rgba(128, 0, 128, 0.2); /* 柔化阴影 */
}

/* 表格样式 - 分层半透+细腻渐变+无生硬白色块【核心优化】解决突兀问题 */
.teacher-table {
    width: 100%;
    border-collapse: separate; /* 分离边框，配合圆角 */
    border-spacing: 0;
    border-radius: 12px; /* 表格整体圆角，更协调 */
    overflow: hidden; /* 裁剪圆角溢出 */
    margin: 20px 0;
    font-family: 楷体;
    font-size: 16px;
}
.teacher-table th, .teacher-table td {
    border: 1px solid rgba(128, 0, 128, 0.08); /* 超柔边框，弱化分割线 */
    padding: 14px 15px;
    text-align: center;
}
/* 表头：渐变半透+紫调融合，不生硬 */
.teacher-table th {
    background: linear-gradient(180deg, rgba(250,250,255,0.7), rgba(245,245,255,0.6));
    color: #800080;
    font-weight: bolder;
    position: relative;
}
/* 表头底部细线条，提升层次，不突兀 */
.teacher-table th::after {
    content: '';
    position: absolute;
    bottom: 0; left: 0;
    width: 100%; height: 1px;
    background: rgba(128,0,128,0.1);
}
/* 偶数行：极浅紫调半透，区分行但不刺眼 */
.teacher-table tr:nth-child(even) {
    background-color: rgba(128, 0, 128, 0.03);
}
/* 悬浮行：淡紫高亮，柔和渐变，无生硬白色 */
.teacher-table tr:hover {
    background-color: rgba(128, 0, 128, 0.06);
    transition: all 0.2s ease;
}
.teacher-table td a {
    color: #800080;
    text-decoration: none;
    margin: 0 5px;
    padding: 2px 6px;
    border-radius: 4px;
    transition: all 0.2s ease;
}
.teacher-table td a:hover {
    text-decoration: none;
    background-color: rgba(128,0,128,0.1); /* 悬浮加淡紫背景，提升交互 */
}
.empty-tip {
    text-align: center;
    font-size: 18px;
    color: #666;
    padding: 30px 0;
}

/* 分页样式 - 全半透紫调+无生硬白色【优化重点】 */
.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    gap: 8px;
}
.pagination button {
    padding: 8px 12px;
    border: 1px solid rgba(128,0,128,0.1);
    border-radius: 8px;
    background-color: rgba(255,255,255,0.5); /* 半透融合，不突兀 */
    color: #800080;
    cursor: pointer;
    font-family: 楷体;
    font-size: 16px;
    transition: all 0.3s ease;
}
.pagination button:hover:not(.disabled) {
    background-color: rgba(128,0,128,0.08); /* 悬浮淡紫，统一风格 */
    border-color: rgba(128,0,128,0.2);
}
.pagination button.active {
    background-color: #800080;
    color: white;
    border-color: #800080;
}
.pagination .disabled {
    cursor: not-allowed;
    color: #999;
    background-color: rgba(255,255,255,0.3); /* 禁用态更透，弱化显示 */
    border-color: rgba(128,0,128,0.05);
}
.pagination .disabled:hover {
    background-color: rgba(255,255,255,0.3);
}

/* 提示信息 - 渐变半透+融于背景【优化】 */
.msg {
    text-align: center;
    font-size: 16px;
    margin-bottom: 20px;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid transparent;
}
.success-msg {
    color: #28a745;
    background-color: rgba(212, 237, 218, 0.5); /* 半透柔和，不突兀 */
    border-color: rgba(212, 237, 218, 0.7);
}
.error-msg {
    color: #dc3545;
    background-color: rgba(248, 215, 218, 0.5); /* 半透柔和，不突兀 */
    border-color: rgba(248, 215, 218, 0.7);
}
</style>
</head>
<body>
    <div class="container">
        <h2>教师信息查询</h2>

        <%-- 提示信息 --%>
        <% String msg = (String) request.getAttribute("msg"); %>
        <% if (msg != null && !msg.isEmpty()) { %>
            <div class="msg <%= msg.contains("成功") ? "success-msg" : "error-msg" %>">
                <%= msg %>
            </div>
        <% } %>

        <%-- 1. 查询表单：所有action/路径完全未改 --%>
        <div class="query-form">
            <form action="queryTeacherByTno" method="get" style="display: flex; align-items: center; gap: 10px;">
                <span>教师编号：</span>
                <input type="number" name="Tno" placeholder="输入教师编号查询" required>
                <button type="submit">精准查询</button>
            </form>
            <form action="queryAllTeacher" method="get" style="margin-left: 20px;">
                <button type="submit">查看所有教师</button>
            </form>
        </div>

        <%-- 2. 教师列表表格 --%>
        <%
            List<Teacher> teacherList = (List<Teacher>) request.getAttribute("teacherList");
            Integer currentPage = (Integer) request.getAttribute("currentPage");
            Integer pageSize = (Integer) request.getAttribute("pageSize");
            Integer totalPages = (Integer) request.getAttribute("totalPages");
            Integer totalCount = (Integer) request.getAttribute("totalCount");
            
            if (currentPage == null) currentPage = 1;
            if (pageSize == null) pageSize = 5;
            if (totalPages == null) totalPages = 1;
            if (totalCount == null) totalCount = 0;
        %>

        <% if (teacherList == null || teacherList.isEmpty()) { %>
            <div class="empty-tip">暂无教师数据！</div>
        <% } else { %>
            <table class="teacher-table">
                <thead>
                    <tr>
                        <th>教师编号</th>
                        <th>教师姓名</th>
                        <th>教师年龄</th>
                        <th>授课课程编号</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Teacher teacher : teacherList) { %>
                        <tr>
                            <td><%= teacher.getTno() %></td>
                            <td><%= teacher.getTname() %></td>
                            <td><%= teacher.getTage() == null ? "未填写" : teacher.getTage() %></td>
                            <td><%= teacher.getCno() == null ? "未分配" : teacher.getCno() %></td>
							<td>
							    <a href="doUpdateCourse">修改信息</a>
							    <a href="${pageContext.request.contextPath}/teacher/delete/<%= teacher.getTno() %>" onclick="return confirm('确认删除该教师吗？')">删除</a>
							</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <%-- 3. 分页控件：JS方法/跳转逻辑完全未改 --%>
            <div class="pagination">
                <button class="<%= currentPage <= 1 ? "disabled" : "" %>" onclick="goToPage(<%= currentPage - 1 %>)" <%= currentPage <= 1 ? "disabled" : "" %>>上一页</button>
                <%
                    int startPage = Math.max(1, currentPage - 2);
                    int endPage = Math.min(totalPages, currentPage + 2);
                    for (int i = startPage; i <= endPage; i++) {
                %>
                    <button class="<%= i == currentPage ? "active" : "" %>" onclick="goToPage(<%= i %>)"><%= i %></button>
                <% } %>
                <button class="<%= currentPage >= totalPages ? "disabled" : "" %>" onclick="goToPage(<%= currentPage + 1 %>)" <%= currentPage >= totalPages ? "disabled" : "" %>>下一页</button>
                <span style="margin-left: 10px;">共<%= totalCount %>条数据 | 第<%= currentPage %>页/共<%= totalPages %>页 | 每页<%= pageSize %>条</span>
            </div>
        <% } %>

        <%-- 返回按钮：跳转方法完全未改 --%>
        <div style="text-align: center; margin-top: 20px;">
            <button onclick="location.href='toManageteacher'" style="padding: 8px 20px; background-color:#800080;color:white;border:none;border-radius:8px;cursor:pointer;transition:all 0.3s ease;">返回教师管理中心</button>
        </div>
    </div>

    <script type="text/javascript">
        function goToPage(pageNum) {
            location.href = "queryAllTeacher?currentPage=" + pageNum + "&pageSize=<%= pageSize %>";
        }
    </script>
</body>
</html>