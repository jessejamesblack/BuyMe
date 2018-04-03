<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create An Auction</title>
</head>
<body>
<h1>Create A New Auction</h1>
Enter the following information:<br>
<form method="post" action="create.jsp">
Item Category: 
<select name="Item Category" size=1>
			<option value="Phone">Cell Phone</option>
			<option value="Laptop">Laptop</option>
		</select>
<br>
Item Manufacturer: <input type="text" name="manuf"><br>
Item Name: <input type="text" name="name"><br>
Closing Date (YYYY-MM-DD H:M:S): <input type="text" name="date"><br>
Reserve Price (optional): <input type="text" name="reserve"><br>
Initial Price: <input type="text" name="initprice"><br>
Increment Amount: <input type="text" name="increment"><br><br>
<input type="submit" value="Begin Auction!">
</form>
</body>
</html>
