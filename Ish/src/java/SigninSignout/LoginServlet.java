package SigninSignout;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet
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
      out.println("<title>Servlet LoginServlet</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
      
      HttpSession session = request.getSession();
      if (session.getAttribute("dbusername") != null)
      {
        session.setAttribute("username", session.getAttribute("dbusername"));
        session.setAttribute("loginTime", new Date());
        System.out.println("user " + session.getAttribute("dbusername") + " successfully logged in.");
        


        session.setMaxInactiveInterval(600);
        if ("on" == session.getAttribute("saveme"))
        {
          out.println("Fariz");
          
          session.setMaxInactiveInterval(120000);
        }
        response.sendRedirect("login.jsp");
      }
      else
      {
        session.setAttribute("errorMessage", "Şifrə və ya ad səhvdi");
        out.println("Invalid username or password, redirect to login page");
        out.println("user " + session.getAttribute("dbusername") + " successfully logged in.");
        response.sendRedirect("index.jsp");
      }
      out.println("</body>");
      out.println("</html>");
    }
    finally
    {
      out.close();
    }
  }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
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