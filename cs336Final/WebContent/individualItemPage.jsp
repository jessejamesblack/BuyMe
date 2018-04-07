<html>
<head>
<title><%=session.getAttribute("itemid")%>'s page</title>
</head>
<center><h1><%=session.getAttribute("userid")%>'s page</h1></center>
<center>

<br>
Bid Amount<input type="text" name="itemName"/>
Max Price Willing to Pay<input type="text" name="itemName"/> 
<input type="submit" value="Bid!"/>
</form>

<br>

<br>

<table border="1" width="100%">
		<tr>
			<th>Seller username <%=session.getAttribute("userid")%></th>
			<th>Item description <%=session.getAttribute("description")%></th>
			<th>Auction time left <%=session.getAttribute("timeleft")%></th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			
		</c:forEach>
	</table>
<table border="1" width="100%">
		<tr>
			<th>Bid Placed</th>
			<th>Offer</th>
			<th>Autobid</th>
			<th>Auctions Current Bid</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.time_placed}" /></td>
				<td><c:out value="${row.offer}" /></td>
				<td><c:out value="${row.autobid}" /></td>
				<td><c:out value="${row.current_highest_bid}" /></td>
			</tr>
		</c:forEach>
	</table>
<br><br>
<a href = "adminloginhome.jsp">Administrator Login Page</a><br>
<a href = "CRloginhome.jsp">Customer Representative Login Page</a><br>
<a href = "AccountDeletion.jsp">Account Deletion Page</a><br><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>
</html>
</center>
