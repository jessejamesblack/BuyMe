<%-- Jesse --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<center>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question and Answer Page</title>
</head>
<body>
<form method="post" action="ask.jsp">
     <table border="1" width="30%" cellpadding="3">
              <thead>
                  <tr>
                      <th  colspan="2">Ask a question</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                      <td>Choose Question Subject:</td>
                      <td><select name="subject">
							<option value="purchases">Purchases</option>
							<option value="returns">Returns</option>
							<option value="payment">Payment</option>
							<option value="account">Account</option>
						</select>
						<br>
					 </td>
                  </tr>
                  <tr>
                      <td>Question:</td>
                      <td><textarea name="question" cols="40" rows="5"></textarea></td>
                  </tr>
                  <tr>
                      <td><input type="submit" value="Submit" /></td>
                      <td><input type="reset" value="Reset" /></td>
                  </tr>
                    
              </tbody>
          </table>
</form>
<a href = "auctionhome.jsp">Home</a><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>

</body>
</center>
</html>