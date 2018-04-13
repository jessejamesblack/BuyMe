<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=session.getAttribute("USERNAME")%>'s Alerts</title>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<center>
<h1><%=session.getAttribute("USERNAME")%>'s Alerts</h1>
<%if(session.getAttribute("USERNAME") == null){
	response.sendRedirect("index.jsp");
}
%>
Create New Alert:<br>
<form method="post" action="createAlert.jsp">
Item Category: 
<select name="Item Category" size=1>
			<option value="Phone">Cell Phone</option>
			<option value="Laptop">Laptop</option>
			<option value="Console">Console</option>
</select><br>
Item Manufacturer: <input type="text" name="manuf"><br>
Item Name: <input type="text" name="name"><br>
<input type="submit" value="Create Alert"> <br>(we'll alert you if an item matching these criteria becomes available)
</form><br>
<%
try {
	String query1 = "SELECT A.alert_number, AU.auction_number, AU.item_name FROM Auction AU, Alert A WHERE AU.item_name = A.item_name AND AU.item_manufacturer = A.item_manufacturer AND AU.item_class = A.item_class AND A.alert_triggered = 1 AND A.user ='" + session.getAttribute("USERNAME") + "'";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
	PreparedStatement pst = conn.prepareStatement(query1);
	ResultSet rs = pst.executeQuery();
	
	out.print("<table>");
	out.print("<tr><th>Triggered Alerts</th><th>Auction#</th><th>Item</th></tr>");
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>");
		out.print(rs.getString("alert_number"));
		out.print("</td>");
		out.print("<td>");
		out.print("<form action='individualItemPage.jsp'><input type='submit' value='" + rs.getString("auction_number") + "' name='item'></form>");
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("item_name"));
		out.print("</td>");
	}
	out.print("</table>");
	
	String query2 = "SELECT * FROM Alert WHERE alert_triggered = 0 AND user = '" + session.getAttribute("USERNAME") + "'";
	PreparedStatement pst2 = conn.prepareStatement(query2);
	ResultSet rs2 = pst2.executeQuery();
	
	out.print("<table>");
	out.print("<tr><th>Active Alerts</th><th>Manuf.</th><th>Item</th></tr>");
	while(rs2.next()){
		out.print("<tr>");
		out.print("<td>");
		out.print(rs2.getString("alert_number"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs2.getString("item_manufacturer"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs2.getString("item_name"));
		out.print("</td>");
	}
	out.print("</table>");
	
	conn.close();
}catch(Exception e){out.print(e.getMessage());}


%>
<a href = "userPage.jsp">User Page</a><br>
<a href = "auctionhome.jsp">Home</a><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>

</center>
</html>
