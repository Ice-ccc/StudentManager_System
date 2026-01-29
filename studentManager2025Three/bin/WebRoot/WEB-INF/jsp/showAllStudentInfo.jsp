<%@ page language="java" import="java.util.*,com.pojo.Student"
	pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>所有学生信息列表</title>
<style type="text/css">
/* 给body添加背景图，关键样式 */
body {
	margin: 0; /* 清除默认边距 */
	padding: 0;
	background-image: url("img/99.jpg"); 
	background-size: cover; /* 背景图全屏覆盖（自适应屏幕大小） */
	background-repeat: no-repeat; /* 背景图不重复 */
	background-attachment: fixed; /* 滚动页面时背景图固定不动 */
	background-position: center; /* 背景图居中显示 */
	background-color: #f5f5f5; /* 背景图加载失败时的备用颜色 */
}

/* 学生列表容器：增加透明度，让背景图可见且不遮挡内容 */
#loginBox {
	margin-left: 18%;
	margin-top: 2%;
	width: 700px;
	height: auto;
	padding: 2% 12%;
	border-radius: 25px;
	background-color: rgba(255, 255, 255, 0.9); /* 白色背景+90%透明度（0.9可调整） */
	box-shadow: 0 0 15px rgba(0,0,0,0.1); /* 增加阴影，提升层次感 */
}

/* 分页控件容器：同样增加背景透明度 */
.pagination {
	margin: 20px auto;
	width: fit-content;
	text-align: center;
	padding: 10px 20px;
	border-radius: 10px;
	background-color: rgba(255, 255, 255, 0.9); /* 白色背景+90%透明度 */
}

/* 错误信息容器：增加背景，避免与背景图混淆 */
.errorMsg {
	color: red;
	text-align: center;
	margin: 10px auto;
	width: fit-content;
	padding: 8px 20px;
	border-radius: 5px;
	background-color: rgba(255, 255, 255, 0.9);
	font-size: 16px;
}

/* 其他原有样式不变，保留以下代码 */
table {
	width: 100%;
	border: 1px black solid;
}

td, th {
	width: 140px;
	text-align: center;
	height: 30px;
}

th {
	background-color: purple;
	color: white;
	font-weight: bold;
}

.showTR {
	border: 1px black solid;
}

.showTR:HOVER {
	background-color: #dddddd;
	border: 1px black solid;
	font-weight: bolder;
	color: blue;
	font-size: 19px;
}

.pagination button, .pagination input, .pagination span {
	padding: 5px 10px;
	margin: 0 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #fff;
}

.pagination button:hover {
	background-color: #eee;
	cursor: pointer;
}

.pagination .active {
	background-color: purple;
	color: white;
	border-color: purple;
}

.pagination .disabled {
	color: #999;
	cursor: not-allowed;
}

/* 返回按钮 */
.back-btn {
	margin-left: 18%;
	margin-top: 1%;
}

.back-button {
	display: inline-block;
	width: 120px;
	background-color: purple;
	color: white;
	border: none;
	padding: 8px;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
}

.back-button:hover {
	background-color: #800080;
}
</style>

<script type="text/javascript">
function jumpPage() {
	var pageNo = document.getElementById("pageNoInput").value;
	window.location.href = "showAllStudentsByPageNo?pageNo=" + pageNo;
}
</script>

</head>
<body>
	<!-- 返回按钮 -->
	<div class="back-btn">
		<a href="toCheckStudent" class="back-button">返回单查页面</a>
		<a href="toMain" class="back-button">返回首页</a>
	</div>

	<div id="loginBox">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>密码</th>
				<th>年龄</th>
				<th>地址</th>
			</tr>
			<%
				ArrayList<Student> allStudents = (ArrayList<Student>) session.getAttribute("allStudents");
				if (allStudents != null && allStudents.size() > 0) {
					for (int i = 0; i < allStudents.size(); i++) {
						Student s = allStudents.get(i);
			%>
			<tr class="showTR">
				<td style="border-bottom: 1px blue solid;"> <%=s.getSno() %> </td>
				<td style="border-bottom: 1px blue solid;"> <%=s.getSname()%> </td>
				<td style="border-bottom: 1px blue solid;"> <%=s.getPwd() %> </td>
				<td style="border-bottom: 1px blue solid;"> <%=s.getAge() %> </td>
				<td style="border-bottom: 1px blue solid;"> <%=s.getAddress() != null ? s.getAddress() : "未填写" %> </td>
			</tr>
			<%
					}
				} else {
			%>
			<tr>
				<td colspan="5" class="no-data">暂无学生信息！</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>

<!-- 分页控件：现在会在学生列表下方正中间显示 -->
<div class="pagination">
    <%
        Integer currentPage = (Integer) session.getAttribute("currentPage");
        Integer totalPages = (Integer) session.getAttribute("totalPages");
        Integer totalCount = (Integer) session.getAttribute("totalCount");
        if (currentPage == null) currentPage = 1;
        if (totalPages == null) totalPages = 1;
        if (totalCount == null) totalCount = 0;
    %>
    <button onclick="window.location.href='showAllStudentsByPageNo?pageNo=1'" 
            <%=currentPage == 1 ? "class='disabled'" : "" %>>首页</button>
    <button onclick="window.location.href='prevPage'" 
            <%=currentPage == 1 ? "class='disabled'" : "" %>>上一页</button>
    <span>当前第 <%=currentPage%> 页 / 共 <%=totalPages%> 页（总计 <%=totalCount%> 条）</span>
    <input type="text" id="pageNoInput" placeholder="页号" style="width: 50px;">
    <button onclick="jumpPage()">跳转</button>
    <button onclick="window.location.href='nextPage'" 
            <%=currentPage == totalPages ? "class='disabled'" : "" %>>下一页</button>
    <button onclick="window.location.href='showAllStudentsByPageNo?pageNo=<%=totalPages%>'" 
            <%=currentPage == totalPages ? "class='disabled'" : "" %>>尾页</button>
</div>

	<!-- 错误信息 -->
	<% String errorMsg = (String) session.getAttribute("errorMsg"); %>
	<% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
		<div class="errorMsg"><%= errorMsg %></div>
		<% session.removeAttribute("errorMsg"); %>
	<% } %>
</body>
</html>