package News;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="news", urlPatterns={"/new"})
public class news
  extends HttpServlet
{
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    try
    {
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet news</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet news at " + request.getContextPath() + "</h1>");
      out.println("</body>");
      out.println("</html>");
      
      out.println(session.getAttribute("dbrole"));
      if (session.getAttribute("dbrole").equals("worker")) {
        response.sendRedirect("newforworker.jsp");
      } else if (session.getAttribute("dbrole").equals("company")) {
        response.sendRedirect("newforcompany.jsp");
      }
    }
    finally
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