<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>admin home</title>
<link href="css/button.css" rel="stylesheet">
<%

String admin_user = String.valueOf(session.getAttribute("admin_user"));
out.println("welcome " + admin_user);

%>
<script type="text/javascript">
function callover(data)
{
	if(data=="x")
		{
		document.getElementById('x').style.color='red';
		}
	else if(data=="y")
		{
		document.getElementById('y').style.color='red';
		}
	
}
function callout(data)
{
	if(data=="x")
		{
		document.getElementById('x').style.color='green';
		}
	else if(data=="y")
	{
	document.getElementById('y').style.color='green';
	}
	
}
</script>
</head>
<body>
<h1></h1>
<div class="bt-des">
<a href="addemployee.jsp"><button id='x' class="a" onmouseover="callover('x')" onmouseout="callout('x')">ADD EMPLOYEE</button></a><br><br>
<a href="addadmin.jsp"><button  id='y' onmouseover="callover('y')" onmouseout="callout('y')" class="b">ADD ADMIN</button></a><br><br>
<a href="viewemp.jsp"><button class="c">VIEW EMPLOYEE</button></a><br><br>
<button class="d">VIEW ADMIN</button><br><br>
<button class="e"> ADD TASK</button><br><br>
<button class="f">ADD SALARY</button><br><br>
<a href="logout.jsp"><button class="g">LOGOUT</button></a>
</div>
</body>
</html>