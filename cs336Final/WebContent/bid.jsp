<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<% int status = 0;
boolean closed = false;
try {
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
    
	if(request.getParameter("bidamount") == ""){
		out.print("Error: you have not entered a bid amount");
	}else {
		double bidamount = Double.parseDouble(request.getParameter("bidamount"));
		Statement st = conn.createStatement();
		ResultSet rs1 = st.executeQuery("SELECT init_price, increment, MAX(bid_amount) AS maxbid FROM Auction A, Bid B WHERE A.auction_number = B.auction_number AND A.auction_number = "+session.getAttribute("AUCTION").toString()+" GROUP BY increment");
		double max,increment;
		if(rs1.next()){
			max = rs1.getDouble("maxbid");
			increment = rs1.getDouble("increment");
			Statement st1 = conn.createStatement();
			ResultSet rs = st1.executeQuery("SELECT NOW() AS now, auction_number, item_class, item_manufacturer, item_name, date_time_close, reserve, init_price, increment, seller_name FROM Auction WHERE auction_number = " + session.getAttribute("AUCTION").toString());
			if(rs.next()){
				if(rs.getString("now").compareTo(rs.getString("date_time_close")) > 0){
					closed = true;
				}
			}
		}else{
			Statement st2 = conn.createStatement();
			ResultSet rs2 = st2.executeQuery("SELECT NOW() AS now, auction_number, item_class, item_manufacturer, item_name, date_time_close, reserve, init_price, increment, seller_name FROM Auction WHERE auction_number = " + session.getAttribute("AUCTION").toString());
			if(rs2.next()){
				if(rs2.getString("now").compareTo(rs2.getString("date_time_close")) > 0){
					closed = true;
				}
				max = rs2.getDouble("init_price");
				increment = 0;
			}else{
				max = 0;
				increment = 0;
			}
			
		}
		
		if(request.getParameter("maxbid") == ""){
			if(bidamount >= max+increment){
				PreparedStatement pst1 = conn.prepareStatement("INSERT INTO Bid(bid_amount,maxBid,username,auction_number) VALUES(?,NULL,?,?)");
				pst1.setDouble(1,bidamount);
				pst1.setString(2, session.getAttribute("USERNAME").toString());
				pst1.setInt(3, Integer.parseInt(session.getAttribute("AUCTION").toString()));
				//out.print(closed);
				if(closed){
					status = 0;
				}else{
					status = pst1.executeUpdate();  
				}
			    if(status > 0) {
			    	out.print("successful bid entry");
			    }else{
			    	out.print("sorry");
			    }
			}else{
				out.print("illegal bid");
			}
		}else{
			double maxbid = Double.parseDouble(request.getParameter("maxbid"));
			if(bidamount >= max+increment){
				PreparedStatement pst2 = conn.prepareStatement("INSERT INTO Bid(bid_amount,maxBid,username,auction_number) VALUES(?,?,?,?)");
				pst2.setDouble(1,bidamount);
				pst2.setDouble(2, maxbid);
				pst2.setString(3, session.getAttribute("USERNAME").toString());
				pst2.setInt(4, Integer.parseInt(session.getAttribute("AUCTION").toString()));
				
				if(closed){
					status = 0;
				}else{
					status = pst2.executeUpdate();      
				}
			    if(status > 0) {
			    	out.print("successful bid entry");
			    }else{
			    	out.print("sorry");
			    }
			}else{
				out.print("illegal bid");
			}
		}
	}
	conn.close();
}catch(Exception e){
	out.print(e.getMessage());
}

%>
</body>
</html>
