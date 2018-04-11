<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Reports</title>
</head>
<center>
<body>
<h1>BuyMe Sales Reports</h1>
<%
try{double earnings;
	int count;
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT SUM(winner) AS earnings FROM (SELECT B.auction_number, MAX(bid_amount) AS winner, reserve FROM Bid B, Auction A WHERE A.auction_number = B.auction_number AND (NOW() > date_time_close) GROUP BY B.auction_number) AS T1 WHERE winner >= reserve");
    if(rs.next()){
    	earnings = rs.getDouble("earnings");
    }else{
    	earnings = 0;
    }
    out.print("Total Earnings: $" + earnings + "<br><br>");
    Statement st2 = conn.createStatement();
    ResultSet rs2 = st2.executeQuery("SELECT COUNT(*) AS numItems FROM Auction");
    if(rs2.next()){
    	count = rs2.getInt("numItems");
    }else{
    	count = 1;
    }
    out.print("Earnings per Item: $" + (earnings/count)+"<br><br>");
    
    PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) AS numItems FROM Auction WHERE item_class = ?");
    ps.setString(1, "Phone");
    ResultSet rs3 = ps.executeQuery();
    if(rs3.next()){
    	count = rs3.getInt("numItems");
    }else{
    	count = 1;
    }
    out.print("Earnings per Phone: $" + (earnings/count)+"<br><br>");
    ps.setString(1, "Computer");
    ResultSet rs4 = ps.executeQuery();
    if(rs4.next()){
    	count = rs4.getInt("numItems");
    }else{
    	count = 1;
    }
    out.print("Earnings per Computer: $"+ (earnings/count) +"<br><br>");
    
    ps.setString(1, "Console");
    ResultSet rs5 = ps.executeQuery();
    if(rs5.next()){
    	count = rs5.getInt("numItems");
    }else{
    	count = 1;
    }
    if(count == 0){
    	count = 1;
    }
    out.print("Earnings per Console: $"+ (earnings/count)+ "<br><br>");
    
    Statement st3 = conn.createStatement();
    ResultSet rs6 = st3.executeQuery("SELECT COUNT(*) AS users FROM Account WHERE accountType = 'E'");
    if(rs6.next()){
    	count = rs6.getInt("users");
    }else {
    	count = 1;
    }
    out.print("Earnings per End-User: $" + earnings/count+"<br><br>");
    
    Statement st4 = conn.createStatement();
    ResultSet rs7 = st4.executeQuery("SELECT item_class, COUNT(*) as count FROM Auction GROUP BY item_class ORDER BY COUNT(*) DESC LIMIT 1");
    if(rs7.next()){
    	out.print("Most common item for sale: " + rs7.getString("item_class"));
    }else{
    	out.print("nothing");
    }
    
	
	conn.close();
}catch(Exception e){out.print(e);}
%>
</body>
</center>
</html>
