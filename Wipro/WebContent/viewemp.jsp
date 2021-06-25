<%@page import="java.sql.*" %>
<style>

h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 50px;
}


/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}


/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}
</style>
<section>
  <!--for demo wrap-->
  <h1>LIST OF EMPLOYEES</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>ID</th>
          <th>FName</th>
          <th>LName</th>
          <th>EmpID</th>
          <th>Start_Date</th>
          <th>Designation</th>
          <th>Department</th>
          <th>End_Date</th>
          <th>Status</th>
          <th>DOB</th>
          <th>Reporting_Manager</th>
          <th>Gender</th>
          <th>Blood_Group</th>
          <th>Address</th>
          <th>Email</th>
          <th>Password</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <%  
        try
        {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "1234");
        	String sql="select * from login";
        	Statement st = con.createStatement();
        	ResultSet rs = st.executeQuery(sql);
        	while(rs.next())
        	{
        		
        	%><tr><td><%out.println(rs.getInt(1));%></td>
        		<td><%out.println(rs.getString(2));%></td>
        		<td><%out.println(rs.getString(3));%></td>
        		<td><%out.println(rs.getString(4));%></td>
        		<td><%out.println(rs.getString(5));%></td>
        		<td><%out.println(rs.getString(6));%></td>
        		<td><%out.println(rs.getString(7));%></td>
        		<td><%out.println(rs.getString(8));%></td>
        		<td><%out.println(rs.getString(9));%></td>
        		<td><%out.println(rs.getString(10));%></td>
        		<td><%out.println(rs.getString(11));%></td>
        		<td><%out.println(rs.getString(12));%></td>
        		<td><%out.println(rs.getString(13));%></td>
        		<td><%out.println(rs.getString(14));%></td>
        		<td><%out.println(rs.getString(15));%></td>
        		<td><%out.println(rs.getString(16));%></td>
        		</tr>
        		<%
        	}
        	
        	
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        %>
       
       
      </tbody>
    </table>
  </div>
</section>
