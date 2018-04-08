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
</center>
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
	out.print("<tr><th>List of Auctions as Seller</th></tr>");
    while(rs.next()){
    	out.print("<tr>");
		out.print("<td>");
		out.print("<form action='itemPage.jsp'><input type='submit' value='" + rs.getString("auction_number") + "' name='item'></form>");
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("item_name"));
		out.print("</td>");
    }
    out.print("<br>");
	conn.close();
    
}catch(Exception e){}

%><br>
<table>
<tr>
    <th>Successful Bids</th>
</tr>
</table><br>
<table>
<tr>
  <th>List of Auctions As Buyer</th>
</tr>
</table><br>

</body>
</html>
