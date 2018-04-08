<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<html>
<head>
<title>Search Results</title>
</head>
<body>
	<h1>Found Results</h1>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/proj2016?autoReconnect=true&useSSL=false"
		user="cmc585" password="cs336" />

	<table border="1" width="100%">
		<tr>
			<th>UPDATE</th>
			
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.upc_code}" /></td>
				
			</tr>
		</c:forEach>
	</table>

</body>
</html>
