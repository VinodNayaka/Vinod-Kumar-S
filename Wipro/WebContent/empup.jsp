<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String employee_user = String.valueOf(session.getAttribute("employee_user"));
out.println("welcome " + employee_user);

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wipro</title>
</head>
<body>
<% 
int ID=0;
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3307/demo", "root", "1234");
	String sql1="select * from login where Eid='"+employee_user+"'";
	Statement st = con1.createStatement();
	ResultSet rs = st.executeQuery(sql1);
	if(rs.next())
	{
	%>
<table>
<form method="post" action="empupdateinsert.jsp">

<tr><td>ID<input type="text" value="<% out.println(rs.getInt(1)); %>"></td></tr>
<tr><td>FName<input type="text" value="<% out.println(rs.getString(2)); %>" ></td></tr>
<tr><td>LName<input type="text" value="<% out.println(rs.getString(3)); %>"></td></tr>
<tr><td>EmpID<input type="text" value="<% out.println(rs.getInt(4)); %>"></td></tr>
<tr><td>Start_Date<input type="text" value="<% out.println(rs.getInt(5)); %>"></td></tr>
<tr><td>Designation<input type="text" value="<% out.println(rs.getString(6)); %>"></td></tr>
<tr><td>Department<input type="text" value="<% out.println(rs.getString(7)); %>"></td></tr>
<tr><td>End_Date<input type="text" value="<% out.println(rs.getString(8)); %>"></td></tr>
<tr><td>Status<input type="text" value="<% out.println(rs.getString(9)); %>"></td></tr>
<tr><td>DOB<input type="text" value="<% out.println(rs.getString(10)); %>"></td></tr>
<tr><td>Reporting_Manager<input type="text" value="<% out.println(rs.getString(11)); %>"></td></tr>
<tr><td>Gender<input type="text" readonly value="<% out.println(rs.getString(12)); %>"></td></tr>
<tr><td>Blood_Group<input type="text" value="<% out.println(rs.getString(13)); %>"></td></tr>
<tr><td>Address<input type="text" value="<% out.println(rs.getString(14)); %>"></td></tr>
<tr><td>Email<input type="text" value="<% out.println(rs.getString(15)); %>"></td></tr>
<tr><td>Password<input type="text" value="<% out.println(rs.getString(16)); %>"></td></tr>
<tr><td><input type="submit" name="submit" value="Update"/></td></tr>

</form>
</table>
</body>
</html>
<%
	//empid=rs.getInt(1);
	}
}
catch(Exception e)
{
	e.printStackTrace();
}

%>