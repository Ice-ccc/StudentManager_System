<%@ page language="java" import="java.util.*,com.pojo.Student"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>模糊查询结果</title>
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
    align-items: center;
    justify-content: center;
    padding: 20px;
}

/* ✅ 统一风格：透明容器+毛玻璃模糊+圆角+浅色边框+弱化阴影 */
.container {
    width: 700px;
    background-color: rgba(255, 255, 255, 0.4);
    padding: 35px 40px;
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(128, 0, 128, 0.1);
    backdrop-filter: blur(5px);
    border: 1px solid rgba(255, 255, 255, 0.5);
}

/* ✅ 统一标题：紫色+居中+下划线+楷体+字号匹配 */
h2 {
    color: #800080;
    text-align: center;
    font-size: 28px;
    margin-bottom: 30px;
    position: relative;
    padding-bottom: 10px;
}

h2::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 2px;
    background-color: #800080;
}

/* ✅ 美化表格：适配整体紫色风格，取消杂乱边框，楷体文字 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    font-family: "楷体", sans-serif;
}

td, th {
    height: 40px;
    text-align: center;
    padding: 0 10px;
    font-size: 17px;
}

/* ✅ 表头样式：紫色背景+白色楷体加粗，无多余边框 */
th {
    background-color: #800080;
    color: white;
    font-weight: bolder;
    font-size: 18px;
}

/* ✅ 表格行样式：隔行浅底，淡紫下边框，统一视觉 */
tr {
    border-bottom: 1px solid rgba(128, 0, 128, 0.2);
}
tr:nth-child(even) {
    background-color: rgba(255, 255, 255, 0.3);
}
tr:hover {
    background-color: rgba(128, 0, 128, 0.08);
}

/* ✅ 无数据提示：紫色文字+楷体+居中，适配风格 */
.no-data {
    text-align: center;
    color: #800080;
    padding: 30px 0;
    font-size: 19px;
    font-weight: bold;
    font-family: "楷体", sans-serif;
}

/* ✅ 按钮组：统一上边框分隔+按钮样式，和前两页完全一致 */
.button-group {
    text-align: center;
    margin-top: 35px;
    padding-top: 20px;
    border-top: 1px solid rgba(128, 0, 128, 0.2);
}

.back-button {
    display: inline-block;
    width: 140px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    padding: 11px 0;
    border-radius: 8px;
    cursor: pointer;
    font-family: "楷体", sans-serif;
    font-size: 18px;
    font-weight: bold;
    text-decoration: none;
    transition: all 0.3s ease;
    margin: 0 8px 15px;
}

.back-button:hover {
    background-color: #800080;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(128, 0, 128, 0.2);
}

/* ✅ 响应式适配：手机端自动缩放，和统一风格保持一致 */
@media (max-width: 768px) {
    .container {
        width: 100%;
        padding: 25px 20px;
    }
    td, th {
        font-size: 15px;
        padding: 0 5px;
    }
    .back-button {
        width: 120px;
        margin: 0 5px 15px;
        font-size: 16px;
    }
}
</style>
</head>
<body>
    <div class="container">
        <h2>姓名模糊查询结果</h2>
        
        <%
            List<Student> fuzzyStudents = (List<Student>) session.getAttribute("fuzzyStudents");
            if (fuzzyStudents == null || fuzzyStudents.size() == 0) {
        %>
            <div class="no-data">未找到匹配的学生信息！</div>
        <%
            } else {
        %>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>密码</th>
                    <th>年龄</th>
                    <th>地址</th>
                </tr>
                <% for (Student s : fuzzyStudents) { %>
                <tr>
                    <td><%=s.getSno() %></td>
                    <td><%=s.getSname()%></td>
                    <td><%=s.getPwd() %></td>
                    <td><%=s.getAge() %></td>
                    <td><%=s.getAddress() != null ? s.getAddress() : "未填写" %></td>
                </tr>
                <% } %>
            </table>
        <% } %>
        
        <div class="button-group">
            <a href="showAllStudents" class="back-button">查看所有学生</a>
            <a href="toCheckStudent" class="back-button">返回查询页面</a>
            <a href="toMain" class="back-button">返回首页</a>
        </div>
    </div>
</body>
</html>