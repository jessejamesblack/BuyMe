<%-- Jesse --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<center>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Answer Question</title>
</head>
<body>
<form method="post" action="answer.jsp">
Enter QuestionID: <input type="text" name="qid"><br>
Answer: <textarea name = "answer" cols = "40" rows="5"></textarea><br>
<input type="submit" value="Submit">
</form>
</body>

<a href = "auctionhome.jsp">Home</a><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>
</center>
</html>
