<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Page</title>
</head>
<body>

<h1>Welcome <%=session.getAttribute("USERNAME")%> to your home page</h1>

<div>
<form method="post" action="member.jsp">
	<a href="auctionhome.jsp"><button type ="button">Search Item </button></a>
	<a href="memberitems.jsp"><button type="button">Check On Your Items</button></a>
	<a href="memberbids.jsp"><button type="button">Check On Bids</button></a>
	<a href="membersimiliar.jsp"><button type="button">Search for similiar items</button></a>

 </form>
</div>


</body>
</html>
