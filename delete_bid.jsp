<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <title>Delete Bid</title>
    </head>

    <body>
        <h1>Delete Auction</h1>

        <% 
        Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
        

            Statement st = conn.createStatement();
            String src = (String)session.getAttribute("USERNAME");
            ResultSet resultset = 
                st.executeQuery("SELECT * FROM demo_bids") ; 
        %>

        <table BORDER="1">
            <tr>
                <th>Bid ID</th>
                <th>Bidder</th>
                
                
            </tr>
            <% while(resultset.next()){ %>
            <tr>
            	<td> <%= resultset.getString(1) %></td>
                <td> <%= resultset.getString(2) %></td>
               
                
            </tr>
            <% } %>
        </table>
        
        
        
       <form method="post" action="demo.jsp">
			<p>Enter Number of Bid you want to delete:<input type="text" name="bid_id" value="" /></p>
			<input type="submit" value="Submit Answer" />
			</form>
    </body>
</html>
