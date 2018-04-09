<%@ page import="java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.lang.*" %>



 <br>
      Search Results
      <br>
      <br>
      ________
      <br>
      <br>

<% 

String[] passArray = request.getParameterValues("passArray");
String[] passPrice = request.getParameterValues("passPrice");

int n=passArray.length;

for (int i=1; i<n; ++i)
{
    float key = Float.parseFloat(passPrice[i]);
    String key2 = passArray[i];
    int j = i-1;

    
    while (j>=0 && Float.parseFloat(passPrice[j]) > key)
    {
        passArray[j+1] = passArray[j];
        passPrice[j+1] = passPrice[j];
        j = j-1;
    }
    passArray[j+1] = key2;
    passPrice[j+1] = passPrice[i];
}

for(int i = 0; i<passArray.length;i++){
	if(passArray[i]!=null && Float.parseFloat(passPrice[i]) != -1 ){
	
	
	%>	
			<form method="post" action = "itemRedirectPage.jsp">
			  <input type="submit" value="<%=passArray[i]%>" name = "poo">, initial price <%out.print(passPrice[i]);%>
			  </form>
			  <br>
			  <br>
	<%	}else{
		passArray[i] = null;
		passPrice[i] = "-1";
		
	}
}
%>
<br>
      Filter By
      <br>
      <br>
      <br>
      <% 
      
      if(!(request.getParameter("manu?").equals("NO"))){
      
    	  
    	  
    	  
      %>
      Manufacturer
      <br>
      _________________
      <br>
      <br>
       <%
       
       Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
       
       Statement stmt = null;
       stmt = conn.createStatement();
       
       
       
       		String query2 = "SELECT DISTINCT item_manufacturer FROM Auction";
      		ResultSet result2 = stmt.executeQuery(query2);
 	  		String store2;
      		while(result2.next()){
		  		store2 = result2.getString("item_manufacturer");
		  		%>
		  		
		  		<form method="post" action = "manufacturerRedirectPage.jsp">
		  		
		  		<% 
		  		 if(request.getParameter("manu?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "manu?" value = "<%="NO"%>">
		  		<%}else{ %>
		  			<Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  		<% }
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<% }
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
		  		
		  		<%}
		  		for(int i = 0; i < passArray.length; i++){
		  		%>
		  		<Input type = "Hidden" name = "passArray" value = "<%= passArray[i] %>">
		  		<Input type = "Hidden" name = "passPrice" value = "<%= passPrice[i] %>">
		  		<% 
		  		}
		  		%>
		  		<Input type = "Hidden" name = "low?" value = "<%="NO"%>">
				<input type="submit" value="<%=store2%>" name = "poo">
			  	</form>
		  
		  
		  		<%  
		  
      		}
      		
      		%>
      
      <br>
      _________________
      <br>
      <% } %>
      <br>
     <% if(!(request.getParameter("cata?").equals("NO"))){ %>
      Item Catagories
      <br>
      _________________
      <br>
      <br>
      <form method="post" action = "itemCatagoriesRedirectPage.jsp">
      <Input type = "Hidden" name = "low?" value = "<%="NO"%>">
      
      
				<% 
		  		 if(request.getParameter("manu?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "manu?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  		<%}%>
		  		<% 
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
		  		<%} %>
		  		<% 
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<%} %>




	 <%
		  for(int i = 0; i < passArray.length; i++){
		  %>
		  <Input type = "Hidden" name = "passArray" value = "<%= passArray[i] %>">
		  <Input type = "Hidden" name = "passPrice" value = "<%= passPrice[i] %>">
		  <% 
		  }
		  %> 
		  
			<input type="submit" value="<%="Console"%>" name = "poo">
			  </form>
	<form method="post" action = "itemCatagoriesRedirectPage.jsp">
	<Input type = "Hidden" name = "low?" value = "<%="NO"%>">
      
      
				<% 
		  		 if(request.getParameter("manu?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "manu?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  		<%}%>
		  		<% 
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
		  		<%} %>
		  		<% 
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<%} %>
	




	 <%
		  for(int i = 0; i < passArray.length; i++){
		  %>
		  <Input type = "Hidden" name = "passArray" value = "<%= passArray[i] %>">
		  <Input type = "Hidden" name = "passPrice" value = "<%= passPrice[i] %>">
		  <% 
		  }
		  %> 
		  
			<input type="submit" value="<%="Computer"%>" name = "poo">
			  </form>
	<form method="post" action = "itemCatagoriesRedirectPage.jsp">
	<Input type = "Hidden" name = "low?" value = "<%="NO"%>">
      
      
				<% 
		  		 if(request.getParameter("manu?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "manu?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  		<%}%>
		  		<% 
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
		  		<%} %>
		  		<% 
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<%} %>
	
		  		




	 <%
		  for(int i = 0; i < passArray.length; i++){
		  %>
		  <Input type = "Hidden" name = "passArray" value = "<%= passArray[i] %>">
		  <Input type = "Hidden" name = "passPrice" value = "<%= passPrice[i] %>">
		  <% 
		  }
		  %> 
		  
			<input type="submit" value="<%="Phone"%>" name = "poo">
			  </form>
		
		
		
      <br>
			
			 
      <br>
      _________________
      <br>
      <%} %>
      <br>
      <%if(!(request.getParameter("bid?").equals("NO"))){ %>
      <form method="post" action = "itemCatagoriesRedirectPage.jsp">
      <Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
      
     			<% 
		  		 if(request.getParameter("manu?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "manu?" value = "<%="NO"%>">
		  		<%}else{ %>
		  			<Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  		<% }
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<% }
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
		  		
		  		<%}%>		  		
      
      
      
      
			<input type="submit" value="<%="Closing Bids"%>" name = "poo">
			  </form>
      <br>
      <br>
    
      _________________
      
      <%} %>
      <br>
