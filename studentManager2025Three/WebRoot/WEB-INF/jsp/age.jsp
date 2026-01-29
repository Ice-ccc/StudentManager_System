<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Student" %>
<%
//导入student列表
	List<Student>studentList=(List<Student>)request.getAttribute("studentList");
//定义参数功能
	String selectedage=(String)request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<title>年龄查询</title>
</head>
<body>
<h2>年龄查询</h2>
<form action="age" method="post">
	选择年龄段：
	<select name="age">
	<option value="">--请选择--</option>
	<option value="青年"<%if("青年".equals(selectedage)){ %>selected<%} %>>青年</option>
	<option value="中年"<%if("中年".equals(selectedage)){ %>selected<%} %>>中年</option>
	<option value="老年"<%if("老年".equals(selectedage)){ %>selected<%} %>>老年</option>
	</select>
	<input type="submit" value="查询">
</form>
 <hr>
    
    <%-- 显示查询结果 --%>
    <% if (studentList != null && !studentList.isEmpty()) { %>
        <h3>查询结果：</h3>
        <table border="1">
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>年龄</th>
                
            </tr>
            
            <% for (Student student : studentList) { %>
            <tr>
                <td><%= student.getSno() %></td>
                <td><%= student.getSname() %></td>
                <td><%= student.getAge() %></td>
            </tr>
            <% } %>
        </table>
    <% } %>

</body>
</html>