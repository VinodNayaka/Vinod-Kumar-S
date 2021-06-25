<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Admin check</title>
</head>
<body>
<%		// JSP open Tag
HttpSession ses = request.getSession();
String session_username = request.getParameter("ID");
ses.setAttribute("admin_user", session_username); // setting session 



String adminuser = request.getParameter("ID");
String adminpass = request.getParameter("pass");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "1234");
	String sql="select * from login where EmpID='"+adminuser+"' and password='"+adminpass+"'";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	if(rs.next())
	{
		//out.println("Login Success");
		//out.println("<html><a href=adminhome.jsp>Click Here Redirect To admin home</a></html>");
		//redirect("adminhome.jsp");
		//request.getRequestDispatcher("adminhome.jsp");
		response.sendRedirect("adminhome.jsp");
	}
	else
	{
		out.println("Login failed");
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}


// JSP close tag // %>		
</body>
</html>