<html>
<head>
<title>Item Page</title>
</head>
<center><h1>Auction #<% String item = request.getParameter("item");
out.print(item);%></h1></center>
<center>
<%session.setAttribute("AUCTION", item); %>
<br><form method="post" action="bid.jsp">
Bid Amount<input type="text" name="bidamount"/>
Max Price Willing to Pay<input type="text" name="maxbid"/> 
<input type="submit" value="Bid!"/>
</form>
<%@page import = "java.sql.*" %>
<%try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM Auction WHERE auction_number = " + item);
    if(rs.next()){
    	out.println("Initial Price: $" + rs.getDouble("init_price") + "<br>");
    	out.print("Minimum Bid Increment: $" + rs.getDouble("increment"));
    }
    %><br><br>

<table border="1" width="100%">
		<tr>
			<th>Seller username: <form method="post" action="individualUserPage.jsp"><input type ="submit" value="<%=rs.getString("seller_name")%>" name="user"></th>
			<th>Item: <%=rs.getString("item_class")%>, <%=rs.getString("item_manufacturer")%>, <%=rs.getString("item_name")%></th>
			<th>Auction ends: <%=rs.getString("date_time_close") %>
			<%//Statement st2 = conn.createStatement();
			//ResultSet rs2 = st2.executeQuery("SELECT TIMESTAMPDIFF(minute,now()," + rs.getString("date_time_close")+")");
			%>
			</th>
		</tr>
	</table>
	<%
	Statement st2 = conn.createStatement();
	ResultSet rs2 = st2.executeQuery("SELECT username, bid_amount FROM Bid WHERE auction_number = " + session.getAttribute("AUCTION").toString() + " ORDER BY bid_amount DESC");
	out.print("<table>");
	out.print("<tr><th colspan = '2'>History Of Bids</th></tr><tr><th>Bidder</th><th>Amount</th></tr>");
    while(rs2.next()){
    	out.print("<tr>");
		out.print("<td>");
		out.print("<form action='individualUserPage.jsp'><input type='submit' value='" + rs2.getString("username") + "' name='user'></form>");
		out.print("</td>");
		out.print("<td>");
		out.print(rs2.getDouble("bid_amount"));
		out.print("</td></tr>");
    }
    out.print("</table>");
    
    conn.close();
}catch(Exception e){
	out.print(e.getMessage());
}

%>


<br><br>
<a href = "adminloginhome.jsp">Administrator Login Page</a><br>
<a href = "CRloginhome.jsp">Customer Representative Login Page</a><br>
<a href = "AccountDeletion.jsp">Account Deletion Page</a><br><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>
</html>
</center>
