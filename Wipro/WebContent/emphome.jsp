<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String employee_user = String.valueOf(session.getAttribute("employee_user"));
out.println("welcome " + employee_user);

%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/button.css" rel="stylesheet">
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
<h1>Welcome Employee</h1>
<div class="bt-des">

<a href="empup.jsp"><button  id='y' onmouseover="callover('y')" onmouseout="callout('y')" class="b">Update Info</button><br><br>
<button class="c">My Profile</button><br><br>
<button class="d">VIEW salary</button><br><br>
<button class="d">VIEW task</button><br><br>
<button class="g">LOGOUT</button>
</div>
</body>
</html>