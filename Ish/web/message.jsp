<%-- 
    Document   : message
    Created on : 31.01.2014, 14:29:41
    Author     : Fariz
--%>


<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
/*
    Cookie[] cookies = request.getCookies();
//String emailAddress = CookieUtil.getCookie(cookies, "emailCookie");
String cookiename="role";
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
                <li class="menuitem"><a href="about.jsp">About</a></li>
                <li class="menuitem"><a href="faq.jsp">Products</a></li>
              <li class="menuitem"><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>
        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

						<div id="leftmenu_main">    
                
                <h4>Xoş gəlmisən</h4>
                    <div class="ex">
                     
                         <p1>Salam, ${sessionScope.username} həmişə sən gələsən!</p1>
								
			
                        </div>        
         
             
                <ul>
                   
                    <li><a href="new">Yeni Elan</a></li>
                    <li><a href="message.jsp">Mesajlar</a></li>
                     <li><a href="newmessages.jsp">Yeni Mesajlar</a></li>
                    <li><a href="logout">Çıxmaq</a></li>
                    
                </ul>
</div>
                
                
        <div id="leftmenu_bottom">
            
        </div>
        </div>
        
        
        
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
            <form action="message" method="post">
                <h3>${sessionScope.sent}</h3>
                        <%
 
            if(session.getAttribute("sent") != null) {
                session.setAttribute("sent","");
            }
        %>               
                Kimə(username)<input type="text" name="whom"><br>
                Mesaj <br> 
                    <textarea name="what" rows="3" cols="50">
           
            </textarea> <br/>                       
            
            <input type="submit" name="send" value="göndər"/> &nbsp;
            
            
</div> 
        <div id="content_bottom">
        </div>
            
            <div id="footer"><h3><a href="http://www.bryantsmith.com"></a></h3></div>
      </div>
</div>
</body>
</html>
