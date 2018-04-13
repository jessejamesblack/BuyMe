<%@ page import="java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.lang.*" %>


<% String userName = session.getAttribute("USERNAME").toString();
String query = "SELECT * FROM Email E WHERE E.to = '" + userName+"' ORDER BY date_time DESC";

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");

Statement stmt = null;
stmt = conn.createStatement();

ResultSet result = stmt.executeQuery(query);





%>

<center>
<h1>  Your E-mails <%=session.getAttribute("USERNAME")%>   </h1>
	<br>
	<br>
	<a href="forum.jsp"><button type="button">Send Question</button></a>
	<br>
	<br>
	
	<%while(result.next()){
		
		%>
		From <%= result.getString("from")%>
		<br>
		To <%= result.getString("to")%>
		<br>
		Date <%= result.getString("date_time") %>
		<br>
		____________________
		<br>
		Content
		<br>
		<br>
		<%= result.getString("content") %>
		<br>
		<br>
		___________________________________________
		<br>
		<br>
		
	
		
	
	<% }%>


</center>
