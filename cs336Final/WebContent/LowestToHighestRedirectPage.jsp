<%-- Ryan --%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.lang.*" %>

<% Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
       
       Statement stmt = null;
       stmt = conn.createStatement();%>

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
String[] passID = request.getParameterValues("passID");

int n=passArray.length;

for (int i=1; i<n; ++i)
{
	
    String key = passPrice[i];
    float keyx = Float.parseFloat(passPrice[i]);
    String key2 = passArray[i];
    String key3 = passID[i];
    int j = i-1;

    
    while (j>=0 && Float.parseFloat(passPrice[j]) > keyx)
    {
        passArray[j+1] = passArray[j];
        passPrice[j+1] = passPrice[j];
        passID[j+1] = passID[j];
        j = j-1;
    }
    passArray[j+1] = key2;
    passPrice[j+1] = key;
    passID[j+1] = key3;
}


for(int i = 0; i<passArray.length;i++){
	
	if(passArray[i]!=null && !(passPrice[i].equals("-1")) && !(passID[i].equals("-1"))){
	
	
	%>	
			<form method="post" action = "individualItemPage.jsp">
			  <input type="submit" value="<%=passID[i]%>" name = "item">, <%out.print(passArray[i]); %>, initial price <%out.print(passPrice[i]);%>
			  </form>
			  <br>
			  <br>
	<%	}else{
		passArray[i] = null;
		passPrice[i] = "-1";
		passID[i] = "-1";
		
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
		  		<Input type = "Hidden" name = "passID" value = "<%= passID[i] %>">
		  		<% 
		  		}
		  		%>
		  		<Input type = "Hidden" name = "low?" value = "<%="NO"%>">
				<input type="submit" value="<%=store2%>" name = "item">
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
		  <Input type = "Hidden" name = "passID" value = "<%= passID[i] %>">
		  <% 
		  }
		  %> 
		  
			<input type="submit" value="<%="Console"%>" name = "item">
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
		  <Input type = "Hidden" name = "passID" value = "<%= passID[i] %>">
		  <% 
		  }
		  %> 
		  
			<input type="submit" value="<%="Computer"%>" name = "item">
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
		  <Input type = "Hidden" name = "passID" value = "<%= passID[i] %>">
		  <% 
		  }
		  %> 
		  
			<input type="submit" value="<%="Phone"%>" name = "item">
			  </form>
		
		
		
      <br>
			
			 
      <br>
      _________________
      <br>
      <%} %>
      <br>
      
      
      <%
      
      conn.close();
      %>
      <br>
