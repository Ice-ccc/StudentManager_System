<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.Student" %>
<%
    // 1. 获取Controller传递的数据
    List<Student> studentList = (List<Student>) request.getAttribute("studentList");
    String errorgender = (String) request.getAttribute("errorgender");
    
    // 2. 获取用户选择的性别
    String selectedGender = request.getParameter("gender");
%>
<!DOCTYPE html>
<html>
<head>
    <title>性别查询</title>
</head>
<body>
    <h2>性别查询</h2>
    
    <%-- 显示错误信息 --%>
    <% if (errorgender != null) { %>
        <p style="color:red;"><%= errorgender %></p>
    <% } %>
    
    <%-- 查询表单 --%>
    <form action="Querygender" method="post">
        选择性别：
        <select name="gender">
            <option value="">--请选择--</option>
            <option value="男" <% if ("男".equals(selectedGender)) { %>selected<% } %>>男生</option>
            <option value="女" <% if ("女".equals(selectedGender)) { %>selected<% } %>>女生</option>
            <option value="全部" <% if ("全部".equals(selectedGender)) { %>selected<% } %>>全部</option>
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
                <th>性别</th>
                
            </tr>
            
            <% for (Student student : studentList) { %>
            <tr>
                <td><%= student.getSno() %></td>
                <td><%= student.getSname() %></td>
                <td><%= student.getGender() %></td>
            </tr>
            <% } %>
        </table>
    <% } %>
</body>
</html>