package net.codejava.email;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// reads form fields
		String recipient = request.getParameter("email");
		String first="Wipro: Your Username is ";
		String second="Your Login Password is :";
		int nf=first.length();
		int sf=second.length();
		String subject = first+ request.getParameter("username");
		String sub = request.getParameter("username");
		String content = second + request.getParameter("password");
		String conn = request.getParameter("password");
		String role = request.getParameter("role");
		int id =0;
		String resultMessage = "";

		try {
			EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
					content);
			resultMessage = "The e-mail was sent successfully <br> Account is Created";
			
			if(role.equals("Admin"))
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3307/wipro", "root", "root");
				String sql="insert into log(username,password,logtype)values(?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, sub);
				ps.setString(2, conn);
				ps.setString(3, role);
				ps.executeUpdate();
				//con.close();
				Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3307/wipro", "root", "root");
				String sql1="select max(id) from log";
				Statement st = con1.createStatement();
				ResultSet rs = st.executeQuery(sql1);
				if(rs.next())
				{
					id = rs.getInt(1);
				}
				//con1.close();
				Connection con2 =DriverManager.getConnection("jdbc:mysql://localhost:3307/wipro", "root", "root");
				
				String sql2 ="insert into employee(empid,username,password)values(?,?,?)";
				PreparedStatement ps1 = con2.prepareStatement(sql2);
				ps1.setInt(1, id);
				ps1.setString(2, sub);
				ps1.setString(3, conn);
				ps1.executeUpdate();
				
			}
			else if(role.equals("Employee"))
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3307/wipro", "root", "root");
				String sql="insert into log(username,password,logtype)values(?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, sub);
				ps.setString(2, conn);
				ps.setString(3, role);
				ps.executeUpdate();
				String sql1="select max(id) from log";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql1);
				if(rs.next())
				{
					id = rs.getInt(1);
				}
				//con.close();
				Connection con3 =DriverManager.getConnection("jdbc:mysql://localhost:3307/wipro", "root", "root");
					
				String sql2 ="insert into employee(empid,username,password)values(?,?,?)";
				PreparedStatement ps1 = con3.prepareStatement(sql2);
				ps1.setInt(1, id);
				ps1.setString(2, sub);
				ps1.setString(3, conn);
				ps1.executeUpdate();
				//con3.close();
			}
			
			
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} finally {
			request.setAttribute("Message", resultMessage);
			getServletContext().getRequestDispatcher("/Result.jsp").forward(
					request, response);
		}
	}
}