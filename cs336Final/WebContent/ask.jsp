<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*"%>
<%
	int status = 0;
try{
    String subject = request.getParameter("subject"); 
    String question = request.getParameter("question");
    String asker = (String)session.getAttribute("USERNAME");
    String fuck = "fuck";
	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
    PreparedStatement pst = conn.prepareStatement("INSERT INTO Account VALUES(?,?,?, ?)");
    
    if(subject == "" || question == "" || asker == ""){
  	  status = 0;
    }
   	pst.setString(1, subject);
   	pst.setString(2, question);
   	pst.setString(3, asker);
   	pst.setString(4, fuck);
   	status = pst.executeUpdate();
   	//status.executeUpdate("INSERT INTO Question(subject, question, answer, asker) VALUES(?, ?, NULL, ?)");  
   	response.sendRedirect("forum.jsp"); 
}catch(Exception e){
	out.print("error");
}
%>