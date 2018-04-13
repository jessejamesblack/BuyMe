<%-- Ryan/Colin/Jesse --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Warnings</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM Warning");
    %>
    <table BORDER="1">
			<tr>
                <th>WarningID</th>
                <th>Auction Item</th>
                <th>Seller</th>
              
            <% while(rs.next()){ %>
            <tr>
                <td><%=rs.getInt(1) %></td>
                <td> <%= rs.getString(2) %></td>
                <td> <%= rs.getString(3) %></td>
            </tr>
            <% } %>
             
        </table>    
    
   <% 
}catch(Exception e){out.print(e);}

%>
</body>
</html>
