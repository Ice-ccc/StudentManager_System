<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>

<%
    request.setCharacterEncoding("utf-8");

    String sno = request.getParameter("sno");
	String newpwd = request.getParameter("newpwd");
	String renewpwd = request.getParameter("renewpwd");

	int _sno = Integer.parseInt(sno);
	
	if(newpwd.equals(renewpwd)){
		//修改密码
		   Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection
				   ("jdbc:mysql://127.0.0.1:3306/studentM","root","123456");
		   String sqlStr = "update stu set pwd = ? where sno = ?";
		   
		   PreparedStatement pst = con.prepareStatement(sqlStr);
		   
		   pst.setString(1, newpwd);
		   pst.setInt(2,_sno);
		  
		   
		   int result = pst.executeUpdate();
		   
		   if (result>0){
			   //修改 成功
			   response.sendRedirect("main.jsp");
			   
		   }else{
			   
			   response.sendRedirect("modifyPwdError.jsp");
		   }
		
		
	}else{
		//直接跳转到修改失败页面
		
		response.sendRedirect("modifyPwdError.jsp");
	}

   



%>
