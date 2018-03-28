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
<form method="post" action = "createauction.jsp">
<input type="submit" value="Sell">
</form>
<br>
<br>
<form method="post" action="userssearch.jsp">
<input type="search">
<input type="submit" value="Search Users">
</form>
<br>
<form method="post" action="itemssearch.jsp">
<input type="search">
<input type="submit" value="Search Items">
</form>
</body>
</center>
</html>
