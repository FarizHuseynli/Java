package Search;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="searchcompany", urlPatterns={"/searchcompany"})
public class searchcompany
  extends HttpServlet
{
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try
    {
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet searchcompany</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet searchcompany at " + request.getContextPath() + "</h1>");
      out.println("</body>");
      out.println("</html>");
      String company = request.getParameter("company");
      String profession = request.getParameter("profession");
      String salary = request.getParameter("salary");
      String dbURL = "jdbc:mysql://localhost:3306/test";
      String username = "root";
      String password = "root";
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(dbURL, username, password);
      
      Statement statement = connection.createStatement();
      ResultSet products = statement.executeQuery("Select * from companyinfo where company like '%" + company + "%' and profession like '%" + profession + "%' and salary>='%" + salary + "'%");
      




      ServletContext context = getServletContext();
      RequestDispatcher dispatcher = context.getRequestDispatcher("contact.java");
      dispatcher.forward(request, response);
    }
    catch (ClassNotFoundException e) {}catch (Exception e) {}finally
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