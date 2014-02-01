package SigninSignout;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginfilter
  implements Filter
{
  private static final boolean debug = true;
  private FilterConfig filterConfig = null;
  
  private void doBeforeProcessing(ServletRequest request, ServletResponse response)
    throws IOException, ServletException
  {
    log("loginfilter:DoBeforeProcessing");
  }
  
  private void doAfterProcessing(ServletRequest request, ServletResponse response)
    throws IOException, ServletException
  {
    log("loginfilter:DoAfterProcessing");
  }

    /**
     *
     * @param request
     * @param response
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException
  {
    log("loginfilter:doFilter()");
    

    doBeforeProcessing(request, response);
    
    Throwable problem = null;
    try
    {
      int a = 0;
      HttpServletRequest req = (HttpServletRequest)request;
      HttpServletResponse res = (HttpServletResponse)response;
      HttpSession session = req.getSession();
      if (session != null) {
        if (session.getAttribute("loginTime") == null) {
          res.sendRedirect("index.jsp");
        }
      }
      chain.doFilter(request, response);
    }
    catch (IOException t)
    {
      problem = t;
    } catch (ServletException t) {
        problem = t;
      }
    doAfterProcessing(request, response);
    if (problem != null)
    {
      if ((problem instanceof ServletException)) {
        throw ((ServletException)problem);
      }
      if ((problem instanceof IOException)) {
        throw ((IOException)problem);
      }
      sendProcessingError(problem, response);
    }
  }
  
  public FilterConfig getFilterConfig()
  {
    return filterConfig;
  }
  
  public void setFilterConfig(FilterConfig filterConfig)
  {
    this.filterConfig = filterConfig;
  }
  
  @Override
  public void destroy() {}
  
  public void init(FilterConfig filterConfig)
  {
    this.filterConfig = filterConfig;
    if (filterConfig != null) {
      log("loginfilter:Initializing filter");
    }
  }
  
  @Override
  public String toString()
  {
    if (filterConfig == null) {
      return "loginfilter()";
    }
    StringBuilder sb = new StringBuilder("loginfilter(");
    sb.append(filterConfig);
    sb.append(")");
    return sb.toString();
  }
  
  private void sendProcessingError(Throwable t, ServletResponse response)
  {
    String stackTrace = getStackTrace(t);
    if ((stackTrace != null) && (!stackTrace.equals(""))) {
      try
      {
        response.setContentType("text/html");
        PrintStream ps = new PrintStream(response.getOutputStream());
        PrintWriter pw = new PrintWriter(ps);
        pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n");
        

        pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
        pw.print(stackTrace);
        pw.print("</pre></body>\n</html>");
        pw.close();
        ps.close();
        response.getOutputStream().close();
      }
      catch (IOException ex) {}
    } else {
      try
      {
        PrintStream ps = new PrintStream(response.getOutputStream());
        t.printStackTrace(ps);
        ps.close();
        response.getOutputStream().close();
      }
      catch (IOException ex) {}
    }
  }
  
  public static String getStackTrace(Throwable t)
  {
    String stackTrace = null;
    try
    {
      StringWriter sw = new StringWriter();
      PrintWriter pw = new PrintWriter(sw);
      t.printStackTrace(pw);
      pw.close();
      sw.close();
      stackTrace = sw.getBuffer().toString();
    }
    catch (IOException ex) {}
    return stackTrace;
  }
  
  public void log(String msg)
  {
    filterConfig.getServletContext().log(msg);
  }
}