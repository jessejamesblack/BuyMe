<%-- Colin --%>
<%@ page import ="java.sql.*" %>
<%
int status = 0;
try{
    String cat = request.getParameter("Item Category");   
    String manf = request.getParameter("manuf");
    String name = request.getParameter("name");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
    PreparedStatement pst = conn.prepareStatement("INSERT INTO Alert(item_class,item_manufacturer,item_name,alert_triggered,user) VALUES(?,?,?,?,?)");
    pst.setString(1, cat);
    pst.setString(2, manf);
    pst.setString(3, name);
    pst.setBoolean(4, false);
    pst.setString(5, session.getAttribute("USERNAME").toString());

    status = pst.executeUpdate();      
    if(status > 0) {
    	response.sendRedirect("auctionhome.jsp");
    }else{
    	response.sendRedirect("alert.jsp");
    }
    conn.close();
}
catch(Exception e){       
   out.println(e.getMessage());
}      


%>
