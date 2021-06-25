<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%		// JSP open Tag

String empuser = request.getParameter("user");
String emppass = request.getParameter("pass");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "1234");
	String sql="select * from login where username='"+empuser+"' and password='"+emppass+"'";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	if(rs.next())
	{
		//int id = rs.getInt(1);
		//String empid = String.valueOf(id);
		HttpSession ses = request.getSession();
		String session_username =request.getParameter("ID");
		ses.setAttribute("employee_user", session_username); // setting session 
		
		out.println("Login Success");
		out.println("<html><a href=emphome.jsp>Click Here Redirect To Employee home</a></html>");
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