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
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");

String query = "SELECT * FROM Auction A WHERE A.item_manufacturer = '" + request.getParameter("poo")+"'";

String[] passArray = request.getParameterValues("passArray");
String[] passPrice = request.getParameterValues("passPrice");
String[] passID = request.getParameterValues("passID");


Statement stmt = null;
stmt = conn.createStatement();

ResultSet result = stmt.executeQuery(query);
String store;
int lengthTable = 0;

ArrayList<String> arr = new ArrayList<String>();

while(result.next()){
	  store = result.getString("item_name");
	  arr.add(store);
	  lengthTable++;
}



for(int i = 0; i<passArray.length;i++){
	if(passArray[i]!=null && arr.contains(passArray[i])&& !(passPrice[i].equals("-1")) && !(passID[i].equals("-1"))){
	
	
	%>	
			<form method="post" action = "individualItemPage.jsp">
			  <input type="submit" value="<%=passID[i]%>" name = "item">, <%out.print(passArray[i]);%>, initial price <%out.print(passPrice[i]);%>
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
      
      if(!(request.getParameter("cata?").equals("NO"))){ %>
      Item Catagories
      <br>
      _________________
      <br>
      <br>
      <form method="post" action = "itemCatagoriesRedirectPage.jsp">
      <Input type = "Hidden" name = "manu?" value = "<%="NO"%>">
      
      
<% 
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<%}%>
		  		<% 
		  		 if(request.getParameter("low?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "low?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  		<%} %>
		  		<% 
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
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
	<Input type = "Hidden" name = "manu?" value = "<%="NO"%>">
	
	
	<% 
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<%}%>
		  		<% 
		  		 if(request.getParameter("low?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "low?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  		<%} %>
		  		<% 
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
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
	<Input type = "Hidden" name = "manu?" value = "<%="NO"%>">

		<% 
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<%}%>
		  		<% 
		  		 if(request.getParameter("low?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "low?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  		<%} %>
		  		<% 
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
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
		
		<% }%>
		
      <br>
      <%if(!(request.getParameter("low?").equals("NO"))){ %>
      _________________
      <br>
      <br>
      <form method="post" action = "LowestToHighestRedirectPage.jsp">
      <Input type = "Hidden" name = "manu?" value = "<%="NO"%>">
      
      
      <% 
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<%}%>
		  		<% 
		  		 if(request.getParameter("low?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "low?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  		<%} %>
		  		<% 
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
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
		  
			<input type="submit" value="<%="Lowest to Highest"%>" name = "item">
			  </form>
			  <%} %>
      <br>
      <%if(!(request.getParameter("bid?").equals("NO"))){ %>
      _________________
      <br>
      <br>
      
      <form method="post" action = "itemCatagoriesRedirectPage.jsp">
      <Input type = "Hidden" name = "manu?" value = "<%="NO"%>">
      
      
      <% 
		  		 if(request.getParameter("cata?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "cata?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  		<%}%>
		  		<% 
		  		 if(request.getParameter("low?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "low?" value = "<%="NO"%>">
		  		<%}else{ %>
		  		<Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  		<%} %>
		  		<% 
		  		 if(request.getParameter("bid?").equals("NO")){
		  		%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="NO"%>">
		  		<%}else{%>
		  		<Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
		  		<%} %>
		  		
      
      
		  		
      
      
			<input type="submit" value="<%="Closing Bids"%>" name = "item">
			  </form>
      <br>
      <br>
     
      _________________
       <%} 
      conn.close();
       %>
      <br>
	 
	 
