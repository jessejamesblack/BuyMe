<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%int status = 0;
try{
	int qid = Integer.parseInt(request.getParameter("qid"));
	String answer = request.getParameter("answer"); 
	String answerer = session.getAttribute("USERNAME").toString();
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
    if(answer == ""){
   		out.print("Error: no answer entered");
    }
    PreparedStatement pst = conn.prepareStatement("UPDATE Question SET answer = ?, answerer = ? WHERE questionID = ?");
	pst.setString(1, answer);
	pst.setString(2, answerer);
	pst.setInt(3, qid);
	
	if(session.getAttribute("ACCOUNTTYPE").toString() != "C"){
		status = 0;
	}else{
		status = pst.executeUpdate();
	}
	if(status >0){
		response.sendRedirect("forum.jsp");
	}else{
		out.print("something went wrong");
	}
	conn.close();
    
}catch(Exception e){
	out.print(e);
}


%>
</body>
</html>
