<%@ page import="java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%
  
  try{
	  Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
	  
      String query = "SELECT * FROM Auction";
      
      String itemName = request.getParameter("itemName"); //Name of the item we are searching for
      
      ArrayList<String> arr = new ArrayList<String>();
      ArrayList<Float> price = new ArrayList<Float>();
    	ArrayList<Integer> id = new ArrayList<Integer>();
	  Statement stmt = null;
	  stmt = conn.createStatement();
	  
	  ResultSet result = stmt.executeQuery(query);
	  String store;
	  int lengthTable = 0;
	  while(result.next()){
		  store = result.getString("item_name");
		  arr.add(store);
		  price.add(result.getFloat("init_price"));
		  id.add(result.getInt("auction_number"));
		  lengthTable++;
	  }
	 
	  ArrayList<String> substrings = new ArrayList<String>();
	  
	  
	  
	  int substringsLength = 0;
	  
	  for(int i = 0; i < itemName.length();i++){
		  
		  for(int j = i; j < itemName.length();j++){
			  substrings.add(itemName.substring(i,j));
			 substringsLength++;
		  }
	  }
  
	  int[] rank = new int[lengthTable];
	  
	  for(int x = 0; x < lengthTable; x++){
		  int count = 0;
		  for(int y = 0; y < substringsLength;y++){
			  if(arr.get(x).toLowerCase().contains(substrings.get(y).toLowerCase())){
				  count++;
			  }
			  
		  }
		  rank[x] = count;
	  }
	  int max = rank[0];
	  
	  for(int e = 1; e < lengthTable;e++ ){
		  if(rank[e] > max){
			  max = rank[e];
		  }
	  }
	  
	//insertion sort
	  int n = rank.length;
      for (int i=1; i<n; ++i)
      {
          int key = rank[i];
          String key2 = arr.get(i);
          float key3 = price.get(i);
          int key4 = id.get(i);
          int j = i-1;

          
          while (j>=0 && rank[j] > key)
          {
              rank[j+1] = rank[j];
              arr.set(j+1, arr.get(j));
              price.set(j+1, price.get(j));
              id.set(j+1, id.get(j));
              j = j-1;
          }
          rank[j+1] = key;
          arr.set(j+1,key2);
          price.set(j+1,key3);
          id.set(j+1,key4);
      }
      
      
      String query2 = "SELECT DISTINCT item_manufacturer FROM Auction";
      ResultSet result2 = stmt.executeQuery(query2);
	  String store2;
	  
	  
      
      
      %> 
      
      
      <br>
      Search Results
      <br>
      <br>
      ________
      <br>
      <br>
      
      
      
      
      
	 <% 
	 String[] passArray = new String[lengthTable];
	 float[] passPrice = new float[lengthTable];
	 int[] passID = new int[lengthTable];
	 
	 for(int e = lengthTable-1; e >= 0;e-- ){
		  if(rank[e] >= (max*0.75)){
			  
			  passArray[e] = arr.get(e);
			  passPrice[e] = price.get(e);
			  passID[e] = id.get(e);
			  %>
			  <form method="post" action = "individualItemPage.jsp">
			  <input type="submit" value="<%=id.get(e)%>" name = "item">, <%out.print(arr.get(e)); %>, initial price <%out.print(price.get(e));%>
			  </form>
			  <br>
			  <br>
			 <% //System.out.print(" ");
			  //System.out.println(rank[e]);
		  }else{
			  passArray[e] = null;
			  passPrice[e] = -1;
			  passID[e] = -1;
		  }
	  }
	 %>
	 <br>
      Filter By
      <br>
      <br>
      Manufacturers
      <br>
      _________________
      <br>
      <br>
      <%
      while(result2.next()){
		  store2 = result2.getString("item_manufacturer");
		  %>
		  <form method="post" action = "manufacturerRedirectPage.jsp">
		  <Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
		  
		  <%
		  for(int i = 0; i < passArray.length; i++){
		  %>
		  <Input type = "Hidden" name = "passArray" value = "<%= passArray[i] %>">
		  <Input type = "Hidden" name = "passPrice" value = "<%= passPrice[i] %>">
		  <Input type = "Hidden" name = "passID" value = "<%= passID[i] %>">
		  <% 
		  }
		  %>
			<input type="submit" value="<%=store2%>" name = "item">
			  </form>
		  
		  
		  <% 
		  
	  }
      
      %>
      <br>
      <br>
      Item Catagories
      <br>
      _________________
      <br>
      <br>
      <form method="post" action = "itemCatagoriesRedirectPage.jsp">
      <Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
   
		  
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
	 <Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
		 
		  
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
	 <Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
		 
		  
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
      _________________
      <br>
      <br>
      <form method="post" action = "LowestToHighestRedirectPage.jsp">
      <Input type = "Hidden" name = "cata?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "manu?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "low?" value = "<%="YES"%>">
		  <Input type = "Hidden" name = "bid?" value = "<%="YES"%>">
      
		  
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
      <br>
      _________________
      <br>
      <br>
	 
	 
	 <% conn.close();
	 
   } catch(Exception e){
	   e.printStackTrace();
       out.println(e);
          }
      
      
      %>
     <a href = "index.jsp">Home</a><br>
<a href = "alert.jsp">Alerts</a><br>
<a href = "forum.jsp">Forums</a>
