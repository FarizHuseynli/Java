
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
            
            <%
            
             if(session.getAttribute("dbrole").equals("worker"))
            {
    
    
            
            
            
            
           %>
            
            <h2>Vakansiyalar arasında özünüzə uyğununu axtarin</h2>
               <form action="search.jsp" method="post">
                   Təşkilat   <br> <input type="text" name="company"><br>
                       Vakansiya <br> <input type="text" name="profession"><br>        
                           Minimal maaş     <br>
                  <input type="number" name="salary"><br>
                          <input type="submit" value="Axtar"><br>
                                  
        <% } 
            
            
            
            try {
            /* TODO output your page here. You may use following sample code. */
        
                String dbURL="jdbc:mysql://localhost:3306/test";
                String username="root";
                String password="root";
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                        dbURL,username,password);
           Statement statement = connection.createStatement();
                if(session.getAttribute("dbrole").equals("worker"))
        {
        String qwery=null;
        qwery=("Select * from userinfo where user='"+session.getAttribute("username")+"'");
       //out.println(qwery);
        
        ResultSet products = statement.executeQuery(qwery);
            out.println("<table border='1' id='customers'>");
            out.println("<tr class='alt'>");
            out.println("<th>Ixtisas</th>");
            out.println("<th>Haqqimda</th>");
            
            out.println("</tr>");
          ResultSetMetaData rsmd = products.getMetaData();
           int columnsNumber;
               columnsNumber = rsmd.getColumnCount();
           out.println("<h1>Elanlarıniz<h1>");
           // Iterate through the data in the result set and display it. 

            while (products.next()) {
            //Print one row          
            for(int i = 1 ; i <= columnsNumber/7; i++){
                out.println("<tr>");
                out.println("<td>");
                out.println(products.getString("profession") + " "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("about") + " "); //Print one element of a row
                out.println("</td>");
                out.println("</tr>");
                }
             
        
        
        }
        }
           else 
            if(session.getAttribute("dbrole").equals("company"))
        {
        String qwery=null;
        qwery=("Select * from companyinfo where user='"+session.getAttribute("username")+"'");
       //out.println(qwery);
        
        ResultSet products = statement.executeQuery(qwery);
            out.println("<table border='1' id='customers'>");
            out.println("<tr class='alt'>");
            out.println("<th>Ixtisas</th>");
            out.println("<th>Maaş</th>");
            out.println("<th>Haqqımızda</th>");
            out.println("</tr>");
          ResultSetMetaData rsmd = products.getMetaData();
           int columnsNumber;
               columnsNumber = rsmd.getColumnCount();
           out.println("<h1>Elanlarıniz<h1>");
           // Iterate through the data in the result set and display it. 

            while (products.next()) {
            //Print one row          
            for(int i = 1 ; i <= columnsNumber/5; i++){
                out.println("<tr>");
                out.println("<td>");
                out.println(products.getString("profession") + " "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("salary") + "manat "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("about") + " "); //Print one element of a row
                out.println("</td>");
                out.println("</tr>");
                }
                     
        
        }
                
       /*
               String company =request.getParameter("company");
        String profession =request.getParameter("profession");
        String salary =request.getParameter("salary");
        if (salary.equalsIgnoreCase(""))
        {
        salary="0";
        }
        
           String qwery=null;
           qwery=("Select * from companyinfo where company like '%"+company+"%' and profession like '%"+profession+"%' and salary>="+salary+"");
         // out.println(qwery);
           ResultSet products = statement.executeQuery(qwery);
            out.println("<table border='1' id='customers'>");
            out.println("<tr class='alt'>");
            out.println("<th>Təşkilat</th>");
            out.println("<th>Maaş</th>");
            out.println("<th>İxtisas</th>");
            out.println("</tr>");
          ResultSetMetaData rsmd = products.getMetaData();
           int columnsNumber;
               columnsNumber = rsmd.getColumnCount();
           out.println("<h1>Nəticələr<h1>");
           // Iterate through the data in the result set and display it. 

            while (products.next()) {
            //Print one row          
            for(int i = 1 ; i <= columnsNumber/5; i++){
                out.println("<tr>");
                out.println("<td>");
                out.println(products.getString("company") + " "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("salary") + " "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("profession") + " "); //Print one element of a row
                out.println("</td>");
                out.println("</tr>");
                }
           */
               }


        } catch(ClassNotFoundException e)
            
//                for(Throwable t : e)
//                    t.printStackTrace();
           { 
             } catch (Exception e)//                for(Throwable t : e)
//                    t.printStackTrace();
        
            
            
             {   
        } finally {
            out.close();
        }  
    
            //out.println(session.getAttribute("dbrole"));
           %> 
           
        
      
            
</div> 
        <div id="content_bottom">hello
        </div>
            
            <div id="footer"><h3><a href="http://www.bryantsmith.com"></a></h3></div>
      </div>
</div>
</body>
</html>
