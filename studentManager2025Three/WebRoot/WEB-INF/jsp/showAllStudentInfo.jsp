<%@ page language="java" import="java.util.*,com.pojo.Student"
	pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>所有学生信息列表</title>
<style type="text/css">
/* ✅ 全站统一：替换为指定背景图 + 毛玻璃基础布局 + 清除默认边距 */
body {
	margin: 0;
	padding: 0;
	background-image: url("${pageContext.request.contextPath}/img/loginbackground.png"); 
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-color: #f5f5f5;
	font-family: "微软雅黑", "楷体", sans-serif;
}

/* ✅ 核心：列表容器改为毛玻璃紫色通透风格（全站统一标准） */
#loginBox {
	margin-left: 18%;
	margin-top: 2%;
	width: 700px;
	height: auto;
	padding: 2% 12%;
	border-radius: 16px;
	background-color: rgba(255, 255, 255, 0.4);
	backdrop-filter: blur(8px);
	-webkit-backdrop-filter: blur(8px);
	box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
	border: 2px solid #800080;
}

/* ✅ 分页容器：毛玻璃紫色通透 + 居中适配 + 样式统一 */
.pagination {
	margin: 20px auto;
	width: fit-content;
	text-align: center;
	padding: 12px 25px;
	border-radius: 16px;
	background-color: rgba(255, 255, 255, 0.4);
	backdrop-filter: blur(8px);
	-webkit-backdrop-filter: blur(8px);
	border: 2px solid #800080;
	box-shadow: 0 4px 12px rgba(128,0,128,0.1);
}

/* ✅ 错误信息容器：毛玻璃风格 + 紫色适配 + 醒目样式 */
.errorMsg {
	color: #dc3545;
	text-align: center;
	margin: 10px auto;
	width: fit-content;
	padding: 10px 25px;
	border-radius: 8px;
	background-color: rgba(255, 255, 255, 0.8);
	backdrop-filter: blur(5px);
	border: 1px solid #dc3545;
	font-size: 16px;
	font-weight: 500;
}

/* ✅ 表格样式：保留原有结构 + 紫色主题配色升级 */
table {
	width: 100%;
	border-collapse: collapse;
}

td, th {
	width: 140px;
	text-align: center;
	height: 30px;
}

/* ✅ 表头：全站主紫色 + 白色文字 + 圆角优化 */
th {
	background-color: #800080;
	color: white;
	font-weight: bold;
	border: none;
}

/* ✅ 表格行：保留hover动效 + 紫色文字适配 + 边框优化 */
.showTR {
	border-bottom: 1px solid rgba(128,0,128,0.1);
	transition: all 0.2s ease;
}

.showTR:HOVER {
	background-color: rgba(128,0,128,0.08);
	font-weight: bolder;
	color: #800080;
	font-size: 19px;
}

/* ✅ 表格单元格边框：改为紫色系，匹配全站风格 */
td {
	border-bottom: 1px solid #d8bfd8 !important;
}

/* ✅ 分页控件：紫色主题配色 + 交互优化 + 保留原有功能 */
.pagination button, .pagination input, .pagination span {
	padding: 6px 12px;
	margin: 0 5px;
	border: 2px solid #800080;
	border-radius: 8px;
	background-color: rgba(255,255,255,0.6);
	color: #333;
	font-family: "微软雅黑", sans-serif;
	transition: all 0.2s ease;
}

.pagination button:hover:not(.disabled) {
	background-color: #800080;
	color: #fff;
	cursor: pointer;
}

.pagination .active {
	background-color: #800080;
	color: white;
	border-color: #800080;
}

.pagination .disabled {
	color: #999;
	cursor: not-allowed;
	background-color: rgba(255,255,255,0.3);
	border-color: #ccc;
}

.pagination input {
	width: 50px;
	text-align: center;
	outline: none;
}
.pagination input:focus {
	background-color: #fff;
	border-color: #6a0dad;
}

/* ✅ 返回按钮：全站统一紫色按钮 + hover加深 + 样式优化 */
.back-btn {
	margin-left: 18%;
	margin-top: 1%;
	display: flex;
	gap: 10px;
}

.back-button {
	display: inline-block;
	width: 120px;
	background-color: #800080;
	color: white;
	border: none;
	padding: 10px 0;
	border-radius: 8px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	font-family: "微软雅黑", sans-serif;
	transition: all 0.2s ease;
}

.back-button:hover {
	background-color: #6a0dad;
	transform: translateY(-2px);
	box-shadow: 0 4px 8px rgba(128,0,128,0.2);
}

/* ✅ 暂无数据样式：适配毛玻璃风格 + 居中醒目 */
.no-data {
	color: #800080;
	font-weight: bold;
	font-size: 16px;
	padding: 20px 0;
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
	<!-- 返回按钮：路径100%未改动 -->
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
				<td> <%=s.getSno() %> </td>
				<td> <%=s.getSname()%> </td>
				<td> <%=s.getPwd() %> </td>
				<td> <%=s.getAge() %> </td>
				<td> <%=s.getAddress() != null ? s.getAddress() : "未填写" %> </td>
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

<!-- 分页控件：功能100%未改动，仅样式优化 -->
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
    <input type="text" id="pageNoInput" placeholder="页号">
    <button onclick="jumpPage()">跳转</button>
    <button onclick="window.location.href='nextPage'" 
            <%=currentPage == totalPages ? "class='disabled'" : "" %>>下一页</button>
    <button onclick="window.location.href='showAllStudentsByPageNo?pageNo=<%=totalPages%>'" 
            <%=currentPage == totalPages ? "class='disabled'" : "" %>>尾页</button>
</div>

	<!-- 错误信息：保留原有逻辑，样式优化 -->
	<% String errorMsg = (String) session.getAttribute("errorMsg"); %>
	<% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
		<div class="errorMsg"><%= errorMsg %></div>
		<% session.removeAttribute("errorMsg"); %>
	<% } %>
</body>
</html>