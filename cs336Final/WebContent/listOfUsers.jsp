<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>
</head>
<h1>List Of Users</h1>
<%
try{
	String usersearch = request.getParameter("usersearch");
    String query = "SELECT * FROM Account WHERE username LIKE '%" + usersearch + "%';";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
    PreparedStatement pst = conn.prepareStatement(query);
    
    ResultSet rs = pst.executeQuery();   
    
		out.print("<table>");
    	while (rs.next()) {%>
    		<form method="post" action = "individualUserPage.jsp">
			  <input type="submit" value="<%out.print(rs.getString("username"));%>" name = "user">
			  </form>
			  <br>
    		<%
		}
    	out.print("</table>");
    conn.close();
}
catch(Exception e){       
   out.print(e.getMessage());       
}   

%>
<a href = "index.jsp">Home</a><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>
<body>
</html>
