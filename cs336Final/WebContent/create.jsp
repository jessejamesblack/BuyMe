<%@ page import ="java.sql.*" %>
<%
int status = 0;
try{
    String cat = request.getParameter("Item Category");   
    String manf = request.getParameter("manuf");
    String name = request.getParameter("name");
    String date = request.getParameter("date");
    double reserve;
    if(request.getParameter("reserve") == ""){
    	reserve = 0;
    }else{
        reserve = Double.parseDouble(request.getParameter("reserve"));
    }
    double initprice = Double.parseDouble(request.getParameter("initprice"));
    double increment = Double.parseDouble(request.getParameter("increment"));
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");    
    PreparedStatement pst = conn.prepareStatement("INSERT INTO Auction(item_class, item_manufacturer, item_name, date_time_close, reserve, init_price, increment, seller_name) VALUES(?,?,?,?,?,?,?,?)");
    pst.setString(1, cat);
    pst.setString(2, manf);
    pst.setString(3, name);
    pst.setString(4, date);
    pst.setDouble(5, reserve);
    pst.setDouble(6, initprice);
    pst.setDouble(7, increment);
    pst.setString(8, session.getAttribute("USERNAME").toString());

    status = pst.executeUpdate();      
    if(status > 0) {
    	response.sendRedirect("createauction.jsp");
    }else{
    	//out.print("sorry");
    }
    conn.close();
}
catch(Exception e){       
   out.println(e.getMessage());
}      


%>
