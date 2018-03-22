package bean;
import java.sql.*;
import static bean.Provider.*;

public class ConnectionProvider {
	static Connection con=null;
	static{
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con=DriverManager.getConnection("jdbc:mysql://cs336db.cyyfsrtrqnib.us-east-2.rds.amazonaws.com:3306/BuyMe","cmc585","cs336databse");
			}catch(Exception e){}
	}
	public static Connection getCon(){
		return con;
	}
}
