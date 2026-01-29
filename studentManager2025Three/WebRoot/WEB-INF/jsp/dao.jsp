<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
// 1. 设置请求编码（POST 请求中文乱码核心解决步骤）
request.setCharacterEncoding("utf-8");

// 2. 获取表单参数
String sno = request.getParameter("sno");
String sname = request.getParameter("sname");
String pwd = request.getParameter("pwd");
String age = request.getParameter("age");
String hobbit = request.getParameter("hobbit");
String address = request.getParameter("address");

// 3. 验证必填参数是否为空
if (sno == null || sname == null || pwd == null || age == null || 
    sno.trim().isEmpty() || sname.trim().isEmpty() || pwd.trim().isEmpty() || age.trim().isEmpty()) {
    response.sendRedirect("zhuceError.jsp");
    return; // 终止后续执行
}

try {
    // 4. 类型转换
    int _sno = Integer.parseInt(sno);
    int _age = Integer.parseInt(age);

    // 5. 数据库连接与操作（显式指定 UTF-8 编码，确保与数据库交互的编码统一）
    Class.forName("com.mysql.cj.jdbc.Driver"); // 注意：新版 MySQL 驱动用 com.mysql.cj.jdbc.Driver，旧版是 com.mysql.jdbc.Driver，根据实际驱动调整
    // 连接 URL 显式指定字符编码为 UTF-8，同时建议加上 serverTimezone 避免时区问题
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://127.0.0.1:3306/studentM?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC",
        "root", "123456"
    );
    String sqlStr = "insert into stu values(?,?,?,?,?,?)"; // 假设表名为 stu
    PreparedStatement pst = con.prepareStatement(sqlStr);
    pst.setInt(1, _sno);
    pst.setString(2, sname);
    pst.setString(3, pwd);
    pst.setInt(4, _age);
    pst.setString(5, hobbit);
    pst.setString(6, address);
    
    int result = pst.executeUpdate();
    if (result > 0) {
        // 注册成功，跳转到registerSuccess.jsp
        response.sendRedirect("registerSuccess.jsp");
    } else {
        // 执行成功但未插入数据，跳转错误页面
        response.sendRedirect("zhuceError.jsp");
    }
    pst.close();
    con.close();
} catch (NumberFormatException e) {
    // 处理数字转换错误
    e.printStackTrace();
    response.sendRedirect("zhuceError.jsp");
} catch (Exception e) {
    // 处理其他异常
    e.printStackTrace();
    response.sendRedirect("zhuceError.jsp");
}
%>