<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
<center>
    <head>
        <title>Forum</title>
    </head>

    <body>
         <h1>Forum</h1>
        <form method="post" action="forum_sortby.jsp">
        
        	<tr>
                      <td>Choose Question Subject:</td>
                      <td><select name="subject">
							<option value="purchases">Purchases</option>
							<option value="returns">Returns</option>
							<option value="payment">Payment</option>
							<option value="account">Account</option>
						</select>
						<br>
					 </td>
                  </tr>
                  <input type="submit" value="Sort"/>
                  </form>

<form method="post" action="forum.jsp">
        <% 
     
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
	        Statement st = conn.createStatement();
            String src = (String)session.getAttribute("USERNAME");
            ResultSet resultset = 
                st.executeQuery("SELECT * FROM Question WHERE subject ='" + request.getParameter("subject") +"'") ; 
        %>
        <table BORDER="1">
			<tr>
                <th>QID</th>
                <th>Username</th>
                <th>Subject</th>
                <th>Question</th>
                <th>Answer</th>
                <th>Answerer</tr>
            <% while(resultset.next()){ %>
            <tr>
                <td><%=resultset.getInt(1) %></td>
                <td> <%= resultset.getString(5) %></td>
                <td> <%= resultset.getString(2) %></td>
                <td> <%= resultset.getString(3) %></td>
                <td> <%= resultset.getString(4) %></td>
                <td> <%= resultset.getString(6) %></td>
            </tr>
            <% } %>
            <% Statement st2 = conn.createStatement();
            String src2 = (String)session.getAttribute("USERNAME");
            ResultSet resultset2 = 
                    st.executeQuery("SELECT * FROM Question WHERE subject <>'" + request.getParameter("subject") +"'") ; 
            
            %>
            <% while(resultset2.next()){ %>
            <tr>
                <td><%=resultset2.getInt(1) %></td>
                <td> <%= resultset2.getString(5) %></td>
                <td> <%= resultset2.getString(2) %></td>
                <td> <%= resultset2.getString(3) %></td>
                <td> <%= resultset2.getString(4) %></td>
                <td> <%= resultset2.getString(6) %></td>
            </tr>
            <% } %>
             
        </table>                          
 </form> 
 	<a href='forum_ask_question.jsp'>Ask a question</a><br> 
 	   <a href='forum_answer_question.jsp'> Answer a Question(CRs ONLY)</a><br> 
 	   <a href = "userPage.jsp">User home</a><br>
 	    <a href = "auctionhome.jsp">Home</a><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>
    </body>

</html>
