<%-- 
    Document   : contact.jsp
    Created on : 31.01.2014, 0:09:01
    Author     : Fariz
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


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>İş</title>
</head>

<body>
  <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ru_RU/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script></script
<div id="container">
		<div id="header"> 
        	<h1>Iş<span class="off">lazımdır?</span></h1>
            <h2></h2>
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="index.jsp">Home</a></li>
                <li class="menuitem"><a href="#">Haqqimizda</a></li>
                <li class="menuitem"><a href="#">Faq</a></li>
              <li class="menuitem"><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>
        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
                
                <h4>Xoş gəlmisən</h4>
                           
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
        	<h2>Saytla bağlı istənilən sualınız varsa aşağdaki üsullarla mənimlə əlaqə qura bilərsiniz</h2>
        	<p>&nbsp;</p>
           	<p>&nbsp;</p>
       	  <h3>Əlaqə nömrəmiz</h3>
              <p>0517788594</p>
              <p>&nbsp;</p>
<h3>Facebookdan mesaj göndərə bilərsiniz</h3>
        	<p><div class="fb-like" data-href="https://www.facebook.com/groups/281647721985770/" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div></p>
        	<p>&nbsp;</p>
        	

            
            <p></p>
            <p>&nbsp;</p>
</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="http://www.bryantsmith.com"></a></h3></div>
      </div>
   </div>
</body>
</html>
