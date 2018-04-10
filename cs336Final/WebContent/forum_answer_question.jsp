<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<%out.print(session.getAttribute("ACCOUNTTYPE")); %>
</body>
</html>
