<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Page</title>
</head>
<body>
<center>
<h1>Welcome <%=session.getAttribute("USERNAME")%> to your home page</h1>

<div>
<form method="post" action="member.jsp">
	<a href="auctionhome.jsp"><button type ="button">Search Item </button></a>
	
	<a href="emails.jsp"><button type="button">Email</button></a>

 </form>
</div>
<br>
<a href = "userPage.jsp">User Page</a><br>
<a href = "auctionhome.jsp">Home</a><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>

</body>
</center>
</html>
