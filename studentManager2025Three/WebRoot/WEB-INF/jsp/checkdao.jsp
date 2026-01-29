<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生信息查询结果</title>
<style type="text/css">
body {
    background-image: url("img/QQQ.jpg");
    background-repeat: no-repeat; 
    background-size: cover; 
    background-position: center; 
    margin: 0; 
    padding: 0; 
    height: 100vh;
    font-family: 楷体;
}

.container {
    width: 600px;
    margin: 0 auto;
    margin-top: 10%;
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 10px;
}

h2 {
    color: purple;
    text-align: center;
}

.info-item {
    margin: 10px 0;
    padding: 5px;
    border-bottom: 1px dashed #ccc;
}

.label {
    display: inline-block;
    width: 100px;
    font-weight: bold;
    color: purple;
}

.error {
    color: red;
    text-align: center;
    padding: 20px;
}

.back-button {
    display: inline-block;
    width: 120px;
    margin: 20px 10px;
    background-color: purple;
    color: white;
    border: none;
    padding: 8px;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
}

.back-button:hover {
    background-color: #800080;
}

.button-group {
    text-align: center;
}

</style>
</head>
<body>
    <%
        
        // 直接处理查询逻辑（无需登录验证）
        request.setCharacterEncoding("utf-8");
        
        // 获取表单提交的学号
        String snoStr = request.getParameter("sno");
        
        // 验证学号是否为空
        if (snoStr == null || snoStr.trim().isEmpty()) {
            out.println("<div class='container'>");
            out.println("<div class='error'>学号不能为空，请重新输入！</div>");
            out.println("<div class='button-group'><a href='check.jsp' class='back-button'>返回查询</a></div>");
            out.println("</div>");
            return;
        }
        
        int sno;
        try {
            sno = Integer.parseInt(snoStr);
        } catch (NumberFormatException e) {
            out.println("<div class='container'>");
            out.println("<div class='error'>学号格式不正确，请输入数字！</div>");
            out.println("<div class='button-group'><a href='check.jsp' class='back-button'>返回查询</a></div>");
            out.println("</div>");
            return;
        }
        
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            // 加载数据库驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 连接数据库
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/studentM?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            
            // 查询学生信息
            String sql = "select * from stu where sno = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, sno);
            
            rs = pst.executeQuery();
            
            out.println("<div class='container'>");
            out.println("<h2>学生信息查询结果</h2>");
            
            if (rs.next()) {
                // 显示学生信息
                out.println("<div class='info-item'>");
                out.println("<span class='label'>学号：</span>");
                out.println(rs.getInt("sno"));
                out.println("</div>");
                
                out.println("<div class='info-item'>");
                out.println("<span class='label'>姓名：</span>");
                out.println(rs.getString("sname"));
                out.println("</div>");
                
                out.println("<div class='info-item'>");
                out.println("<span class='label'>密码：</span>");
                out.println(rs.getString("pwd"));
                out.println("</div>");
                
                out.println("<div class='info-item'>");
                out.println("<span class='label'>年龄：</span>");
                out.println(rs.getInt("age"));
                out.println("</div>");
                
                out.println("<div class='info-item'>");
                out.println("<span class='label'>爱好：</span>");
                out.println(rs.getString("hobbit"));
                out.println("</div>");
                
                out.println("<div class='info-item'>");
                out.println("<span class='label'>地址：</span>");
                out.println(rs.getString("address"));
                out.println("</div>");
            } else {
                out.println("<div class='error'>未找到学号为 " + sno + " 的学生信息！</div>");
            }
            
            out.println("<div class='button-group'>");
            out.println("<a href='check.jsp' class='back-button'>返回查询</a>");
            out.println("<a href='main.jsp' class='back-button'>返回首页</a>");
            out.println("</div>");
            out.println("</div>");
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<div class='container'>");
            out.println("<div class='error'>数据库驱动加载失败！</div>");
            out.println("<div class='button-group'><a href='check.jsp' class='back-button'>返回</a></div>");
            out.println("</div>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<div class='container'>");
            out.println("<div class='error'>数据库操作失败！</div>");
            out.println("<div class='button-group'><a href='check.jsp' class='back-button'>返回</a></div>");
            out.println("</div>");
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
</body>
</html>