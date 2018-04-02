<%@ page import="java.sql.*"%>
<%@ page import= "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%
  
  try{
	  Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
	  
      String query = "SELECT * FROM Auction";
      
      String itemName = request.getParameter("itemName");; //Name of the item we are searching for
      
      ArrayList<String> arr = new ArrayList<String>();
      
	  Statement stmt = null;
	  stmt = conn.createStatement();
	  
	  ResultSet result = stmt.executeQuery(query);
	  String store;
	  int lengthTable = 0;
	  while(result.next()){
		  store = result.getString("item_name");
		  arr.add(store);
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
          int j = i-1;

          
          while (j>=0 && rank[j] > key)
          {
              rank[j+1] = rank[j];
              arr.set(j+1, arr.get(j));
              j = j-1;
          }
          rank[j+1] = key;
          arr.set(j+1,key2);
      }
      out.println("Items");%>
      ____________________
      <br>
      <br>
	 <% 
	 if(max>=2){
	 
	 for(int e = lengthTable-1; e >= 0;e-- ){
		  if(rank[e] >= (max*0.6)){
			  out.println(arr.get(e));%>
			  <br>
			  <br>
			 <% //System.out.print(" ");
			  //System.out.println(rank[e]);
		  }
	  }
	 }else{
		 out.println("No items found");
		 
	 }
   } catch(Exception e){
          out.print("error");
          }
      
      
      %>
