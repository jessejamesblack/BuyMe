<%@page import="java.sql.*"%>
<%
	session.setAttribute("USERNAME", null);
	session.setAttribute("EMAIL", null);
	session.invalidate(); 
	response.sendRedirect("index.jsp");
%>
