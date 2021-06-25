<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<link href="css/logstyle.css" rel="stylesheet"/>
</head>
<body>
<div class="form-des">
<h1>Admin Login Here</h1>
<table>
<form method="post" action="admincheck.jsp">
<tr><td><input class="a" type="text" name="ID" placeholder="EmpID" required/></td></tr>
<tr><td><input class="b" type="password" name="pass" placeholder="Password" required/></td></tr>
<tr><td><input class="c" type="submit" name="submit" value="Login"/></td></tr>
</form>
</table>
</div>
</body>
</html>