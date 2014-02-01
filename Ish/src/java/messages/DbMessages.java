package messages;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DbMessages
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
      String from_user = null;
      String message = null;
      String to_user = null;
      
      from_user = (String)session.getAttribute("username");
      message = request.getParameter("what");
      
      to_user = request.getParameter("whom");
      if (request.getParameter("hidden") != null) {
        to_user = "admin";
      }
      out.println(to_user);
      
      String dbURL = "jdbc:mysql://localhost:3306/test";
      String dbusername = "root";
      String dbpassword = "root";
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(dbURL, dbusername, dbpassword);
      


      String query = "INSERT INTO messages (from_user, message,to_user,ifread)VALUES ('" + from_user + "', " + "'" + message + "'," + "'" + to_user + "'," + "'not_read')";
      




      out.println(query);
      Statement statement = connection.createStatement();
      int rowCount = statement.executeUpdate(query);
      if (request.getParameter("hidden") != null) {
        response.sendRedirect("contact.jsp");
      }
      response.sendRedirect("message.jsp");
      
      session.setAttribute("sent", "Mesajiniz göndərildi");
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
  
  @Override
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