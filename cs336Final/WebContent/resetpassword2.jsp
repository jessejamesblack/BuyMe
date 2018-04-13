<%-- Ryan/Colin/Jesse --%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");


String userName = request.getParameter("uname");

String newPassword = request.getParameter("pass");

String query = "UPDATE Account SET pwd = '" + newPassword + "' WHERE username = '" + userName + "'";

Statement stmt = null;
stmt = conn.createStatement();

stmt.executeUpdate(query);

conn.close();
%>
<h1>  Your E-mails Password has been successfully changed!!!!!!!   </h1>
<a href="index.jsp"><button type="button">Home</button></a>
<br>
<br>
