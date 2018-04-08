<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if ((session.getAttribute("USERNAME") == null) || (session.getAttribute("USERNAME") == "")) {
%>

You are not logged in. <a href="index.jsp">Please Login Here</a>

<%
} else {
%>

Welcome <%=session.getAttribute("USERNAME")%> ! <a href='logout.jsp'>Logout Here</a>
<br>
<a href='userPage.jsp'>Go to Your Member Home Page Here</a><br><br>
<h2>Question and Answer</h2>
<a href='forum.jsp'>Send Question to CSR Here</a><br>
<h2>Messages</h2>


<%
  }
%>