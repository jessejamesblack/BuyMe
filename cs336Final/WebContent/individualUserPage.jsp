<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<center>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%out.print(request.getParameter("user"));%>'s Page</title>
<h1><%out.print(request.getParameter("user"));%>'s Page</h1>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>

<body>
<%
try{
	String user = request.getParameter("user");
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse"); 
    PreparedStatement pst = conn.prepareStatement("SELECT * FROM Auction WHERE seller_name = ?");
    pst.setString(1, user);
    ResultSet rs = pst.executeQuery();
	out.print("<table>");
	out.print("<tr><th colspan = '2'>List of Auctions as Seller</th></tr><tr><th>Auction#</th><th>Item</th></tr>");
    while(rs.next()){
    	out.print("<tr>");
		out.print("<td>");
		out.print("<form action='individualItemPage.jsp'><input type='submit' value='" + rs.getString("auction_number") + "' name='item'></form>");
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("item_name"));
		out.print("</td></tr>");
    }
    out.print("</table><br>");
    PreparedStatement pst2 = conn.prepareStatement("SELECT distinct Bid.auction_number, item_name FROM Auction, Bid WHERE Bid.auction_number = Auction.auction_number AND Bid.username = ?");
    pst2.setString(1, user);
    ResultSet rs2 = pst2.executeQuery();
    out.print("<table>");
    out.print("<tr><th colspan = '2'>List of Auctions as Buyer</th></tr><tr><th>Auction#</th><th>Item</th></tr>");
    while(rs2.next()){
    	out.print("<tr>");
		out.print("<td>");
		out.print("<form action='individualItemPage.jsp'><input type='submit' value='" + rs2.getString("auction_number") + "' name='item'></form>");
		out.print("</td>");
		out.print("<td>");
		out.print(rs2.getString("item_name"));
		out.print("</td></tr>");
    }
    out.print("</table><br>");
    PreparedStatement pst3 = conn.prepareStatement("SELECT A.auction_number, B.bid_amount, A.item_name FROM Bid B, Auction A where B.bid_amount > A.reserve and A.auction_number = B.auction_number and NOW() > A.date_time_close and B.username = ? and B.bid_amount = (SELECT MAX(bid_amount) FROM Bid where Bid.auction_number = A.auction_number)");
	pst3.setString(1, user);
	ResultSet rs3 = pst3.executeQuery();
	out.print("<table>");
    out.print("<tr><th colspan = '3'>Successful Bids</th></tr><tr><th>Auction#</th><th>Amount</th><th>Item</th></tr>");
    while(rs3.next()){
    	out.print("<tr>");
		out.print("<td>");
		out.print("<form action='individualItemPage.jsp'><input type='submit' value='" + rs3.getString("auction_number") + "' name='item'></form>");
		out.print("</td>");
		out.print("<td>");
		out.print(rs3.getString("bid_amount"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs3.getString("item_name"));
		out.print("</td></tr>");
    }
	out.print("</table>");
    
    conn.close();
    
}catch(Exception e){out.print(e);}

%><br>

<br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a><br>
<a href = "auctionhome.jsp">Home</a>
</center>
</body>
</html>
