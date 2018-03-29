<%@page import="java.sql.*"%>
<%
	session.setAttribute("USERNAME", null);
	session.setAttribute("EMAIL", null);
	response.sendRedirect("index.jsp");
%>
