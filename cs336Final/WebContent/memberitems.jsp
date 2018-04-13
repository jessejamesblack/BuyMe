<%-- Ryan/Colin/Jesse --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Current Items For Auction</title>
</head>
<body>
<h1>Auctions</h1>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/proj2016?autoReconnect=true&useSSL=false"
		user="cmc585" password="cs336database" />

	<table border="1" width="100%">
		<tr>
			<th>Auction ID</th>
			<th>Date Created</th>
			<th>Auto Sale Price</th>
			<th>Current Highest Bid</th>

		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.auction_id}" /></td>
				<td><c:out value="${row.date_created}" /></td>
				<td><c:out value="${row.auto_sale_price}" /></td>
				<td><c:out value="${row.current_highest_bid}" /></td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>
