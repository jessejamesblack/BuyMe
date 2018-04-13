<%-- Ryan --%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.lang.*" %>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");


String query = "SELECT * FROM Auction";

Statement stmt = null;
stmt = conn.createStatement();

ResultSet result = stmt.executeQuery(query);
%>   

<form ACTION = "deleteAuction2.jsp">
<h1>  Delete Auctions  </h1><br>
______________________________________
<br>
<br>
<%
while(result.next()){
 %>
 <br>
	 <input type = "checkbox" name = "item" value = "<%= result.getString("auction_number")%>">, Item: <%= result.getString("item_name")%>, Auction Number: <%= result.getString("auction_number")%>, Seller: <%=  result.getString("seller_name")%> <br>
	 <br>
	 
	 
	 <%}%>
	 <br>
	 <input type="submit" value="Submit">
</form>


<% conn.close();%><br>
<a href = "CRHome.jsp">Customer Representative Home Page</a><br>
