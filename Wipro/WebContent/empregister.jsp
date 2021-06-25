<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Properties" %>
    <%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.AddressException"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
<%
 String host;
 String port;
 String user;
 String pass;
String ID = request.getParameter("r1");
String fn = request.getParameter("r2");
String ln = request.getParameter("r3");
String Eid = request.getParameter("r4");
String strt = request.getParameter("r5");
String desig = request.getParameter("r6");
String dt = request.getParameter("r7");
String end = request.getParameter("r8");
String stat = request.getParameter("r9");
String dob = request.getParameter("r10");
String rm = request.getParameter("r11");
String  Gn= request.getParameter("r12");
String  bg= request.getParameter("r13");
String  ad= request.getParameter("r14");
String  em= request.getParameter("r15");
String  password= request.getParameter("r16");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3307/wipro", "root", "root");
	PreparedStatement ps = con.prepareStatement("insert into admin(EmpID,Fname,Lname,Gender,Password,Email,DOB,Designation,Reporting Manager,Address,Blood_Group)values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1, ID);
	ps.setString(2, fn);
	ps.setString(3, ln);
	ps.setString(4, Eid);
	ps.setString(5, strt);
	ps.setString(6, desig);
	ps.setString(7, dt);
	ps.setString(8, end);
	ps.setString(9, stat);
	ps.setString(10, dob);
	ps.setString(11, rm);
	ps.setString(12, Gn);
	ps.setString(13, bg);
	ps.setString(14, ad);
	ps.setString(14, em);
	ps.setString(14, password);
	int i = ps.executeUpdate();
	if(i==1)
	{
		out.println("Register Success !!!!");
		// sending Email code-> Real Time Operation //
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
		String toaddress = request.getParameter("em");
		String susername = request.getParameter("Eid");
		String spassword = request.getParameter("password");
		String resultMessage = "";
		try {
			Properties properties = new Properties();
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.port", port);
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");

			// creates a new session with an authenticator
			Authenticator auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, pass);
				}
			};

			Session session1 = Session.getInstance(properties, auth);

			// creates a new e-mail message
			Message msg = new MimeMessage(session1);

			msg.setFrom(new InternetAddress(user));
			InternetAddress[] toAddresses = { new InternetAddress(toaddress) };
			msg.setRecipients(Message.RecipientType.TO, toAddresses);
			msg.setSubject(susername);
			msg.setSentDate(new Date());
			msg.setText(spassword);

			// sends the e-mail
			Transport.send(msg);
			resultMessage = "The e-mail was sent successfully";
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} finally {
			request.setAttribute("Message", resultMessage);
			getServletContext().getRequestDispatcher("/Result.jsp").forward(
					request, response);
		}
	}
	else
	{
		out.println("Register failed !!!!");
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}



%>
</body>
</html>