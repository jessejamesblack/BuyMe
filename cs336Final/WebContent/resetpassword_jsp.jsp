<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*"%>
<%
	
    String csr_id = (String)session.getAttribute("userid");
    String pwd = request.getParameter("pass");
    session.setAttribute("member_pwd", pwd);
    String username = request.getParameter("uname");
    session.setAttribute("member_uname", username);
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
    Statement st = conn.createStatement();
    
    ResultSet rs;
    String update_request = "UPDATE account SET password='" + pwd + "' WHERE username='"+username+"'";
    st.executeUpdate("INSERT INTO messages(message_id, src, dest, msg_text) VALUES(NULL,'CUSTOMER SERVICE','"+username+"','Your new Password is: "+pwd+"')");
    
    
    int i = st.executeUpdate(update_request);
    
   if (i > 0) {
        
        response.sendRedirect("reset_password_success.jsp");
      
    } else {
        response.sendRedirect("index.jsp");
    }
    
