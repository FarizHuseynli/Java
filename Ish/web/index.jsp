
<%-- 
    Document   : index
    Created on : 25.01.2014, 2:28:48
    Author     : Fariz
--%>
<%--<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>  
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.ServletException"%>


<%
if(session.getAttribute("username")!=null)
    response.sendRedirect("login.jsp");
/*
        Cookie[] cookies = request.getCookies();
//String emailAddress = CookieUtil.getCookie(cookies, "emailCookie");
String cookiename="username";
String cookievalue="";
if(cookies!=null)
{
for(int i=0;i<cookies.length;i++)
    {
        Cookie cookie= cookies[i];
        if(cookiename.equals(cookie.getName()))
        { response.sendRedirect("login.jsp");
    
        }

    }       
}
*/
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>İş</title>
</head>

<body>
<div id="container">
		<div id="header"> 
        	<h1>Iş<span class="off">lazımdır?</span></h1>
            <h2></h2>
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="index.jsp">Home</a></li>
                <li class="menuitem"><a href="#">Haqqimizda</a></li>
                <li class="menuitem"><a href="#">FAQ</a></li>
              <li class="menuitem"><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>
        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
                
                <h4>Daxil ol</h4>
                    <div class="ex">
                     
                        <form name="login" action="logintest" method="post">
                        <h3>${sessionScope.errorMessage}</h3>
                        <%
 
            if(session.getAttribute("errorMessage") != null) {
                session.setAttribute("errorMessage","");
            }
        %>                       
                        <h3>İstifadəçi adı</h3> <input type="text" name="username" ><br>
                        <h3>Şifrə:<h3> <input type="password" name="password"><br>
                                        <input type="radio" name="saveme" class="check" id="check-1" /><p1>yadda saxla</p1>
                                        <h3>         <input type="submit" value="daxil ol"> 
                       <a href="register.jsp" style="color: #8FB2B2">burada təzəyəm</a></h3>
                                   		
                         	
                        
                        </form>
                        </div>        
                <ul>
                   
                    <li><a href="register.jsp">Registrasiyadan keç</a></li>
                    
                </ul>
</div>
                
                
        <div id="leftmenu_bottom">
            
        </div>
        </div>
        
        
        
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
             
            <h2>Vakansiyalar arasında özünüzə uyğununu axtarin</h2>
               <form action="search.jsp" method="post">
                   Təşkilat   <br> <input type="text" name="company"><br>
                       Vakansiya <br> <input type="text" name="profession"><br>        
                           Minimal maaş     <br>
                  <input type="number" name="salary"><br>
                          <input type="submit" value="Axtar"><br>
                   
  </div>         
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="http://www.bryantsmith.com"></a></h3></div>
      
            </div>
   </div>
   
</body>
</html>
