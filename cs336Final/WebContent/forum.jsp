<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <title>Forum</title>
    </head>

    <body>
        <h1>Forum</h1>
<form method="post" action="vqna.jsp">
        <% 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
	        Statement st = conn.createStatement();
            String src = (String)session.getAttribute("USERNAME");
            ResultSet resultset = 
                st.executeQuery("SELECT * FROM Question") ; 
        %>

        <table BORDER="1">
			<tr>
                <th>Username</th>
                <th>Subject</th>
                <th>Question</th>
                <th>Answer</th>
            </tr>
            
            <c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.time_placed}" /></td>
				<td><c:out value="${row.offer}" /></td>
				<td><c:out value="${row.autobid}" /></td>
				<td><c:out value="${row.current_highest_bid}" /></td>
			</tr>
		</c:forEach>
        </table>                          
 </form>       
        <a href='success.jsp'>Go Back to Previous Page</a>
    </body>
</html>