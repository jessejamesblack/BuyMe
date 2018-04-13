<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Home</title>
</head>
<center>
<body>
<h1>BuyMe Auction Home</h1>
<br>
<form method="post" action="listOfUsers.jsp">
<input type="text" name="usersearch">
<input type="submit" value="Search Users">
</form>
<br>
<form method="post" action="RankingAlgorithm.jsp">
<input type="text" name="itemName"/>
<input type="submit" value="Search Items">
</form>
<br>
<form method="post" action = "createauction.jsp">
<input type="submit" value="Sell">
</form>
<br>
<form method="post" action="logout.jsp">
<input type="submit" value="Logout"><br>
<br>
<a href = "userPage.jsp">User Page</a><br>
<a href = "auctionhome.jsp">Home</a><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>
</form>
</body>
</center>
</html>
