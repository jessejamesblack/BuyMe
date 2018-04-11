<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<center>
<title>Administrator Action Page</title>
</center>
</head>
<body>
<center>
<h1>Administrator Actions:</h1>
<form method="post" action="CRcreateAccount.jsp">
Create a Customer Representative Account<br/>
Username:<input type="text" name="username"/><br/>
Email Address:<input type="text" name="email"/><br/>
Password:<input type="password" name="password"/><br/>
<input type="submit" value="Register"/>
</form>
<br><a href="CRaccountDeletion.jsp">Delete CR Account</a><br>
<a href ="sales.jsp">Generate Sales Reports</a><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>
</center>
</body>
</html>
