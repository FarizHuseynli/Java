package Registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="RegistrationServlet", urlPatterns={"/register"})
public class RegistrationServlet
  extends HttpServlet
{
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try
    {
      String dbURL = "jdbc:mysql://localhost:3306/test";
      String dbusername = "root";
      String dbpassword = "root";
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(dbURL, dbusername, dbpassword);
      if (request.getParameter("hidden").equals("worker"))
      {
        String query = "INSERT INTO user (username, password,email,role)VALUES ('" + request.getParameter("username") + "', " + "'" + request.getParameter("password") + "'," + "'" + request.getParameter("email") + "'," + "'worker')";
        
        Statement statement = connection.createStatement();
        int rowCount = statement.executeUpdate(query);
        








        String qweri = "INSERT INTO userinfo (user,firstname,lastname,birthdate,workstatus,profession,about)VALUES ('" + request.getParameter("username") + "', " + "'" + request.getParameter("name") + "'," + "'" + request.getParameter("surname") + "'," + "'" + request.getParameter("bday") + "'," + "'" + request.getParameter("status") + "'," + "'" + request.getParameter("ixtisaslar") + "'," + "'" + request.getParameter("about") + "')";
        
        int rouCount = statement.executeUpdate(qweri);
        





        HttpSession session = request.getSession();
        session.setAttribute("username", request.getParameter("username"));
        session.setAttribute("loginTime", new Date());
        session.setAttribute("dbrole", request.getParameter("hidden"));
        session.setAttribute("workerfirstname", request.getParameter("name"));
        session.setAttribute("workerlastname", request.getParameter("surname"));
        session.setAttribute("workerbirthdate", request.getParameter("bday"));
        response.sendRedirect("login.jsp");
      }
      else if (request.getParameter("hidden").equals("company"))
      {
        String query = "INSERT INTO user (username, password,email,role)VALUES ('" + request.getParameter("username") + "', " + "'" + request.getParameter("password") + "'," + "'" + request.getParameter("email") + "'," + "'company')";
        
        Statement statement = connection.createStatement();
        int rowCount = statement.executeUpdate(query);
        






        String qweri = "INSERT INTO companyinfo (user,company,salary,profession,about)VALUES ('" + request.getParameter("username") + "', " + "'" + request.getParameter("name") + "'," + "'" + request.getParameter("salary") + "'," + "'" + request.getParameter("ixtisaslar") + "'," + "'" + request.getParameter("about") + "')";
        
        int rouCount = statement.executeUpdate(qweri);
        
        HttpSession session = request.getSession();
        session.setAttribute("username", request.getParameter("username"));
        session.setAttribute("loginTime", new Date());
        
        response.sendRedirect("login.jsp");
      }
      else if (request.getParameter("hidden").equals("newworker"))
      {
        HttpSession session = request.getSession();
        










        String qweri = "INSERT INTO userinfo (user,firstname,lastname,birthdate,workstatus,profession,about)VALUES ('" + session.getAttribute("username") + "', " + "'" + session.getAttribute("workerfirstname") + "'," + "'" + session.getAttribute("workerlastname") + "'," + "'" + session.getAttribute("workerbirthdate") + "'," + "'" + request.getParameter("status") + "'," + "'" + request.getParameter("ixtisaslar") + "'," + "'" + request.getParameter("about") + "')";
        
        Statement statement = connection.createStatement();
        
        int rouCount = statement.executeUpdate(qweri);
        
        response.sendRedirect("login.jsp");
      }
      else if (request.getParameter("hidden").equals("newcompany"))
      {
        HttpSession session = request.getSession();
        





        String qweri = "INSERT INTO companyinfo (user,company,salary,profession,about)VALUES ('" + session.getAttribute("username") + "', " + "'" + session.getAttribute("companyname") + "'," + "'" + request.getParameter("salary") + "'," + "'" + request.getParameter("ixtisaslar") + "'," + "'" + request.getParameter("about") + "')";
        out.println(qweri);
        Statement statement = connection.createStatement();
        int rouCount = statement.executeUpdate(qweri);
        response.sendRedirect("login.jsp");
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
    processRequest(request, response);
  }
  
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  
  @Override
  public String getServletInfo()
  {
    return "Short description";
  }
}