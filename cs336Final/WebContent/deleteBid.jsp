<%-- Ryan --%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.lang.*" %>
<head><title>Delete Bids</title></head>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");


String query = "SELECT * FROM Bid";

Statement stmt = null;
stmt = conn.createStatement();

ResultSet result = stmt.executeQuery(query);
%>   

<form ACTION = "deleteBid2.jsp">
<h1>  Delete Bids  </h1><br>
______________________________________
<br>
<br>
<%
while(result.next()){
 %>
 <br>
	 <input type = "checkbox" name = "item" value = "<%= result.getString("bid_number")%>"> Auction#: <%= result.getString("auction_number") %>, Bid Amount: <%= result.getString("bid_amount")%>, Bidder: <%= result.getString("username")%>  <br>
	 <br>
	 
	 
	 <%}%>
	 <br>
	 <input type="submit" value="Submit">
</form>


<% conn.close();%><br>
<a href = "CRHome.jsp">Customer Representative Home Page</a><br>





