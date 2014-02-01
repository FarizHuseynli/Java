package SigninSignout;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="logintest", urlPatterns={"/logintest"})
public class logintest
  extends HttpServlet
{
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try
    {
      String ad = "";
      String sifre = "";
      if (request.getParameter("username") != null) {
        ad = request.getParameter("username").trim();
      }
      if (request.getParameter("password") != null) {
        sifre = request.getParameter("password").trim();
      }
      HttpSession session = request.getSession();
      
      String dbURL = "jdbc:mysql://localhost:3306/test";
      String username = "root";
      String password = "root";
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(dbURL, username, password);
      
      Statement statement = connection.createStatement();
      ResultSet products = statement.executeQuery("Select username,role from user where password='" + sifre + "'");
      
      String indb = null;
      String inrole = null;
      String infn = null;
      String inln = null;
      String inbd = null;
      String incn = null;
      while (products.next())
      {
        indb = products.getString("username");
        inrole = products.getString("role");
      }
      if (inrole.equals("worker"))
      {
        ResultSet info = statement.executeQuery("Select firstname,lastname,birthdate from userinfo where user='" + indb + "'");
        while (info.next())
        {
          infn = info.getString("firstname");
          inln = info.getString("lastname");
          inbd = info.getString("birthdate");
          session.setAttribute("workerfirstname", infn);
          session.setAttribute("workerlastname", inln);
          session.setAttribute("workerbirthdate", inbd);
        }
      }
      else if (inrole.equals("company"))
      {
        out.println(indb);
        
        ResultSet info = statement.executeQuery("Select company from companyinfo where user='" + indb + "'");
        while (info.next())
        {
          incn = info.getString("company");
          
          session.setAttribute("companyname", incn);
        }
      }
      out.println(indb);
      if (ad.equals(indb))
      {
        session.setAttribute("dbusername", ad);
        session.setAttribute("dbrole", inrole);
      }
      if (request.getParameter("saveme") != null) {
        session.setAttribute("saveme", "on");
      }
      out.println(session.getAttribute("dbusername"));
      
      out.println(sifre);
      response.sendRedirect("login");
    }
    catch (ClassNotFoundException e) {}catch (SQLException e) {}finally
    {
      out.close();
    }
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  
  public String getServletInfo()
  {
    return "Short description";
  }
}