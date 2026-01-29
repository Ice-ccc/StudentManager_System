<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>处理结果</title>
<style type="text/css">
.modal {
    display: flex;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    align-items: center;
    justify-content: center;
}

.modal-content {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    width: 300px;
}

.modal-button {
    background-color: purple;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 15px;
}

.error-modal {
    color: red;
}

.success-modal {
    color: green;
}
</style>
</head>
<body>

<%
    // 1. 删除：检查用户是否已登录及未登录跳转的代码
    
    // 直接处理表单提交（无需登录验证）
    request.setCharacterEncoding("utf-8");
    
    // 获取表单提交的参数
    String snoStr = request.getParameter("sno");
    String sname = request.getParameter("sname");
    String pwd = request.getParameter("pwd");
    String ageStr = request.getParameter("age");
    String hobbit = request.getParameter("hobbit");
    String address = request.getParameter("address");
    String action = request.getParameter("action");
    
    if (snoStr == null || snoStr.trim().isEmpty()) {
        response.sendRedirect("deleteError.jsp?msg=学号不能为空");
        return;
    }
    
    int sno;
    try {
        sno = Integer.parseInt(snoStr);
    } catch (NumberFormatException e) {
        response.sendRedirect("deleteError.jsp?msg=学号格式不正确，必须为数字");
        return;
    }
    
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String message = "";
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/studentM?useUnicode=true&characterEncoding=utf-8", "root", "123456");
        
        String checkSql = "SELECT * FROM stu WHERE sno = ?";
        pst = con.prepareStatement(checkSql);
        pst.setInt(1, sno);
        rs = pst.executeQuery();
        
        if (!rs.next()) {
            response.sendRedirect("deleteError.jsp?msg=学号不存在，请检查后重试");
            return;
        }
        
        String dbSname = rs.getString("sname");
        String dbPwd = rs.getString("pwd");
        int dbAge = rs.getInt("age");
        String dbHobbit = rs.getString("hobbit");
        String dbAddress = rs.getString("address");
        
        rs.close();
        pst.close();
        
        if ("删除学生".equals(action)) {
            if (sname == null || !sname.trim().equals(dbSname)) {
                response.sendRedirect("deleteError.jsp?msg=姓名不正确，无法删除");
                return;
            }
            
            if (pwd == null || !pwd.trim().equals(dbPwd)) {
                response.sendRedirect("deleteError.jsp?msg=密码不正确，无法删除");
                return;
            }
            
            int age;
            try {
                age = Integer.parseInt(ageStr);
                if (age != dbAge) {
                    response.sendRedirect("deleteError.jsp?msg=年龄不正确，无法删除");
                    return;
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("deleteError.jsp?msg=年龄格式不正确");
                return;
            }
            
            if (hobbit == null || !hobbit.trim().equals(dbHobbit)) {
                response.sendRedirect("deleteError.jsp?msg=爱好不正确，无法删除");
                return;
            }
            
            if (address == null || !address.trim().equals(dbAddress)) {
                response.sendRedirect("deleteError.jsp?msg=地址不正确，无法删除");
                return;
            }
            
            String deleteSql = "delete from stu where sno = ?";
            pst = con.prepareStatement(deleteSql);
            pst.setInt(1, sno);
            
            int result = pst.executeUpdate();
            if (result > 0) {
                message = "删除学生成功";
            } else {
                response.sendRedirect("deleteError.jsp?msg=删除失败，请重试");
                return;
            }
        } else if ("修改信息".equals(action)) {
            StringBuilder updateSql = new StringBuilder("update stu set ");
            boolean hasParam = false;
            
            if (sname != null && !sname.trim().isEmpty()) {
                updateSql.append("sname = ?, ");
                hasParam = true;
            }
            if (pwd != null && !pwd.trim().isEmpty()) {
                updateSql.append("pwd = ?, ");
                hasParam = true;
            }
            if (ageStr != null && !ageStr.trim().isEmpty()) {
                try {
                    int age = Integer.parseInt(ageStr);
                    if (age < 1 || age > 150) {
                        response.sendRedirect("deleteError.jsp?msg=年龄必须在1-150岁之间");
                        return;
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect("deleteError.jsp?msg=年龄格式不正确，必须为数字");
                    return;
                }
                updateSql.append("age = ?, ");
                hasParam = true;
            }
            if (hobbit != null && !hobbit.trim().isEmpty()) {
                updateSql.append("hobbit = ?, ");
                hasParam = true;
            }
            if (address != null && !address.trim().isEmpty()) {
                updateSql.append("address = ?, ");
                hasParam = true;
            }
            
            if (!hasParam) {
                response.sendRedirect("deleteError.jsp?msg=请至少输入一个要修改的字段");
                return;
            }
            
            updateSql.setLength(updateSql.length() - 2);
            updateSql.append(" where sno = ?");
            
            pst = con.prepareStatement(updateSql.toString());
            
            int paramIndex = 1;
            if (sname != null && !sname.trim().isEmpty()) {
                pst.setString(paramIndex++, sname);
            }
            if (pwd != null && !pwd.trim().isEmpty()) {
                pst.setString(paramIndex++, pwd);
            }
            if (ageStr != null && !ageStr.trim().isEmpty()) {
                pst.setInt(paramIndex++, Integer.parseInt(ageStr));
            }
            if (hobbit != null && !hobbit.trim().isEmpty()) {
                pst.setString(paramIndex++, hobbit);
            }
            if (address != null && !address.trim().isEmpty()) {
                pst.setString(paramIndex++, address);
            }
            
            pst.setInt(paramIndex, sno);
            
            int result = pst.executeUpdate();
            if (result > 0) {
                message = "修改信息成功";
            } else {
                response.sendRedirect("deleteError.jsp?msg=修改失败，请重试");
                return;
            }
        } else {
            response.sendRedirect("deleteError.jsp?msg=未知操作");
            return;
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        response.sendRedirect("deleteError.jsp?msg=数据库驱动加载失败");
        return;
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("deleteError.jsp?msg=数据库操作失败");
        return;
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
    <div class="modal">
        <div class="modal-content success-modal">
            <h3>操作成功</h3>
            <p><%= message %></p>
            <button class="modal-button" onclick="window.location.href='main.jsp'">返回首页</button>
        </div>
    </div>
    <script type="text/javascript">
        setTimeout(function() {
            window.location.href = 'main.jsp';
        }, 3000);
    </script>
<%
%>

</body>
</html>