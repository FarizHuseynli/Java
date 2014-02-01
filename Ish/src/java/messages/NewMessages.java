package messages;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NewMessages
  extends HttpServlet
{
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, ClassNotFoundException, SQLException
  {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try
    {
      HttpSession session = request.getSession();
      
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet DbMessages</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet DbMessages at " + request.getContextPath() + "</h1>");
      out.println("</body>");
      out.println("</html>");
      String user = null;
      String message = null;
      String to_user = null;
      user = (String)session.getAttribute("username");
      



      String dbURL = "jdbc:mysql://localhost:3306/test";
      String dbusername = "root";
      String dbpassword = "root";
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(dbURL, dbusername, dbpassword);
      


      String query = "select * messages where to_user='" + user + "' and read='not_read'";
      out.println(query);
      Statement statement = connection.createStatement();
      ResultSet products = statement.executeQuery(query);
      

      out.println("<table border='1' id='customers'>");
      out.println("<tr class='alt'>");
      out.println("<th>Kimden</th>");
      out.println("<th>Mesaj</th>");
      out.println("</tr>");
      ResultSetMetaData rsmd = products.getMetaData();
      
      int columnsNumber = rsmd.getColumnCount();
      while (products.next()) {
        for (int i = 1; i <= columnsNumber / 4; i++)
        {
          out.println("<tr>");
          out.println("<td>");
          out.println(products.getString("from_user") + " ");
          out.println("</td>");
          out.println("<td>");
          out.println(products.getString("message") + " ");
          out.println("</td>");
          out.println("</tr>");
        }
      }
    }
    catch (ClassNotFoundException e) {}catch (SQLException e) {}finally
    {
      out.close();
    }
  }
  
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    try
    {
      processRequest(request, response);
    }
    catch (ClassNotFoundException ex)
    {
      Logger.getLogger(DbMessages.class.getName()).log(Level.SEVERE, null, ex);
    }
    catch (SQLException ex)
    {
      Logger.getLogger(DbMessages.class.getName()).log(Level.SEVERE, null, ex);
    }
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    try
    {
      processRequest(request, response);
    }
    catch (ClassNotFoundException ex)
    {
      Logger.getLogger(DbMessages.class.getName()).log(Level.SEVERE, null, ex);
    }
    catch (SQLException ex)
    {
      Logger.getLogger(DbMessages.class.getName()).log(Level.SEVERE, null, ex);
    }
  }
  
  @Override
  public String getServletInfo()
  {
    return "Short description";
  }
}