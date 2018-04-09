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
                st.executeQuery("SELECT * FROM questions where questions.a_text !='Answer Pending'") ; 
        %>

        <table BORDER="1">
			<tr>
                <th>Username</th>
                <th>Subject</th>
                <th>Question</th>
                <th>Answer</th>
            </tr>
            <% while(resultset.next()){ %>
            <tr>
                <td> <%= resultset.getString(2) %></td>
                <td> <%= resultset.getString(3) %></td>
                <td> <%= resultset.getString(4) %></td>
                <td> <%= resultset.getString(5) %></td>
            </tr>
            <% } %>
        </table>                          
 </form>       
        <a href='success.jsp'>Go Back to Previous Page</a>
    </body>
</html>