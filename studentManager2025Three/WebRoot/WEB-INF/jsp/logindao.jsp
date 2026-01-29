<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
// 设置请求编码（处理中文乱码）
request.setCharacterEncoding("utf-8");

// 获取表单提交的学号和密码
String sno = request.getParameter("sno");
String pwd = request.getParameter("pwd");

// 验证参数是否为空
if (sno == null || pwd == null || sno.trim().isEmpty() || pwd.trim().isEmpty()) {
    response.sendRedirect("loginError.jsp");
    return;
}

Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

try {
    // 1. 转换学号为整数（数据库中学号通常为数字类型）
    int _sno = Integer.parseInt(sno);
    
    // 2. 加载数据库驱动并建立连接
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://127.0.0.1:3306/studentM?useUnicode=true&characterEncoding=utf-8",
        "root", "123456"
    );
    
    // 3. 查询数据库中是否存在匹配的学号和密码
    String sql = "select * from stu where sno=? and pwd=?"; // 假设表名为stu，密码字段为pwd
    pst = con.prepareStatement(sql);
    pst.setInt(1, _sno);
    pst.setString(2, pwd);
    
    rs = pst.executeQuery();
    
    // 4. 判断查询结果：存在则登录成功，存储用户信息到Session，跳转登录成功页
    if (rs.next()) {
        // 只存储表中已存在的字段（删除对course_count和credit的读取）
        session.setAttribute("sname", rs.getString("sname")); // 学生姓名（表中存在的字段）
        session.setAttribute("sno", rs.getString("sno"));     // 学号（表中存在的字段）
        
        // 跳转至登录成功提示页
        response.sendRedirect("loginSuccess.jsp");
    } else {
        // 用户名或密码错误，跳转错误页
        response.sendRedirect("loginError.jsp");
    }

} catch (NumberFormatException e) {
    // 学号格式错误（非数字）
    e.printStackTrace();
    response.sendRedirect("loginError.jsp");
} catch (SQLException e) {
    // 数据库操作异常
    e.printStackTrace();
    response.sendRedirect("loginError.jsp");
} catch (Exception e) {
    // 其他异常
    e.printStackTrace();
    response.sendRedirect("loginError.jsp");
} finally {
    // 关闭资源
    try {
        if (rs != null) rs.close();
        if (pst != null) pst.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>