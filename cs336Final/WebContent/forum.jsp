<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <title>Forum</title>
    </head>

    <body>
        <h1>Forum</h1>
<form method="post" action="vqna.jsp">
        <% 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
        %>

        <table BORDER="1">
            

        </table>
             
                  
                      <p>Filter by Subject:</p>
                      <select name="sel">
							<option value="purchases">Purchases</option>
							<option value="returns">Returns</option>
							<option value="payment">Payment</option>
							<option value="account">Account</option>
						</select>
						<br>
					
                      <input type="submit" value="Submit" />
                     
              
               
         
                  
                    
            
          
 </form>       
        <a href='success.jsp'>Go Back to Previous Page</a>
    </body>
</html>