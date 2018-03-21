/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.85
 * Generated at: 2018-03-20 22:00:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.cs336.pkg.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class newBeer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!--Import some libraries that have classes that we need -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");

	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		String str = "SELECT COUNT(*) as cnt FROM beers";

		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);

		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		result.next();
		//Parse out the result of the query
		int countBeers = result.getInt("cnt");

		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		str = "SELECT COUNT(*) as cnt FROM bars";
		//Run the query against the DB
		result = stmt.executeQuery(str);
		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		result.next();
		//Parse out the result of the query
		int countBars = result.getInt("cnt");

		//Get parameters from the HTML form at the HelloWorld.jsp
		String newBar = request.getParameter("bar");
		String newBeer = request.getParameter("beer");
		float price = Float.valueOf(request.getParameter("price"));


		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO sells(bar, beer, price)"
				+ "VALUES (?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newBar);
		ps.setString(2, newBeer);
		ps.setFloat(3, price);
		//Run the query against the DB
		ps.executeUpdate();

		//Check counts once again (the same as the above)
		str = "SELECT COUNT(*) as cnt FROM beers";
		result = stmt.executeQuery(str);
		result.next();
		System.out.println("Here I am!");
		int countBeersN = result.getInt("cnt");
		System.out.println(countBeersN);
		str = "SELECT COUNT(*) as cnt FROM bars";
		result = stmt.executeQuery(str);
		result.next();
		int countBarsN = result.getInt("cnt");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		//Compare counts of the beers and bars before INSERT on Sells and after to figure out whether there is a bar and a beer stub records inserted by a trigger. 
		int updateBeer = (countBeers != countBeersN) ? 1 : 0;
		int updateBar = (countBars != countBarsN) ? 1 : 0;
		;
		System.out.println(updateBeer + "   " + updateBar);
		if (updateBeer > 0) {
			//Create a dynamic HTML form for beer update if needed. The form is not going to show up if the beer specified at index.jsp already exists in the database.
			out.print("Beer " + newBeer + " details: <br>");
			out.print("<form method=\"post\" action=\"newBeerDetails.jsp\">"
					+ "<table> <tr>	<td>Manf</td><td><input type=\"text\" name=\"manufacturer\"></td>   	</tr>"
					+ "</table> <br>");
		}

		if (updateBar > 0) {
			//Create a dynamic HTML form for bar update if needed. The form is not going to show up if the bar  specified at HelloWorld.jsp already exists in the database..
			//The form goes inside the HTML table too make alignment of the elements prettier.
			//See show.jsp for clear notation of the HTML table and HelloWorld.jsp for clear notation of the HTML form
			out.print("Bar " + newBar + " details: <br>");
			out.print("<table> <tr>	<td>Address</td><td><input type=\"text\" name=\"addr\"></td>   	</tr>"
					+ " 	<tr>  	<td>License</td><td><input type=\"text\" name=\"license\"></td> 	</tr>"
					+ "	<tr>  	<td>City</td><td><input type=\"text\" name=\"city\"></td> 	</tr>"
					+ "	<tr>  	<td>Phone</td><td><input type=\"text\" name=\"phone\"></td> 	</tr>"
					+ "</table> <br> <input type=\"submit\" value=\"submit\">"
					+
					//use hidden inputs to pass the new beer and new bar keys as well as requiresUpdate flags to the update page.
					"<input type=\"hidden\" name=\"bar\" value=\""
					+ newBar
					+ "\"/>"
					+ "<input type=\"hidden\" name=\"beer\" value=\""
					+ newBeer
					+ "\"/>"
					+ "<input type=\"hidden\" name=\"ubar\" value=\""
					+ Integer.toString(updateBar)
					+ "\"/>"
					+ "<input type=\"hidden\" name=\"ubeer\" value=\""
					+ Integer.toString(updateBeer) + "\"/>" + "</form>");
		}

		out.print("insert succeeded");
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}

      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
