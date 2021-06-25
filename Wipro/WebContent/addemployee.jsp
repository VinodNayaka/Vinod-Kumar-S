<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

String admin_user = String.valueOf(session.getAttribute("admin_user"));
out.println("welcome " + admin_user);

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wipro</title>
</head>
<body>
	<form action="EmailSendingServlet" method="post">
		<table border="0" width="50" align="center">
			<caption><h2>Add Employee Here</h2></caption>
			<tr>
				<td width="50%">Email </td>
				<td><input type="text" name="email" size="50"/></td>
			</tr>
			<tr>
				<td width="50%">UserName </td>
				<td><input type="text" name="username" size="50"/></td>
			</tr>
			<tr>
				<td>Password </td>
				<td><input type="password" name="password" size="50" value="welcome" readonly/></td>
			</tr>
			<tr>
				<td>Role </td>
				<td><input type="text" name="role" value="Employee"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Send"/></td>
			</tr>
		</table>
		
	</form>
</body>
</html>