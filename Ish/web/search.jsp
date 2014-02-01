<%-- 
    Document   : search
    Created on : 31.01.2014, 12:45:41
    Author     : Fariz
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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

				   
        <%
        if(session.getAttribute("username")==null)
        {
        %>       
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
                   
                    <li><a href="#">İş axtaranlara bax</a></li>
                    <li><a href="register.jsp">Registrasiyadan keç</a></li>
                    
                </ul>
</div>
                
      <%
        }
            else{
        %>                 	
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
                         <%
        }
                         %>
        <div id="leftmenu_bottom">
            
        </div>
        </div>
<style>
#customers
{
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
width:100%;
border-collapse:collapse;
}
#customers td, #customers th 
{
font-size:1em;
border:1px solid #98bf21;
padding:3px 7px 2px 7px;
}
#customers th 
{
font-size:1.1em;
text-align:left;
padding-top:5px;
padding-bottom:4px;
background-color:#A7C942;
color:#ffffff;
}
#customers tr.alt td 
{
color:#000000;
background-color:#EAF2D3;
}
</style>
        
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
             <br>
                 <br>
        
        
        <%
  try {
            /* TODO output your page here. You may use following sample code. */
           
        String company =request.getParameter("company");
        String profession =request.getParameter("profession");
        String salary =request.getParameter("salary");
        if (salary.equalsIgnoreCase(""))
        {
        salary="0";
        }
        
        String dbURL="jdbc:mysql://localhost:3306/test";
                String username="root";
                String password="root";
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                        dbURL,username,password);
           Statement statement = connection.createStatement();
           String qwery=null;
           qwery=("Select * from companyinfo where company like '%"+company+"%' and profession like '%"+profession+"%' and salary>="+salary+"");
         // out.println(qwery);
           
           ResultSet products = statement.executeQuery(qwery);
           if(!products.next())
           {
           out.println("<h1>Belə bir vakansiya yoxdur</h1>");
           }
           else
           {
           out.println("<table border='1' id='customers'>");
            out.println("<tr class='alt'>");
            out.println("<th>Təşkilat</th>");
            out.println("<th>Maaş</th>");
            out.println("<th>İxtisas</th>");
            out.println("</tr>");
             out.println("<tr>");
                out.println("<td>");
                out.println(products.getString("company") + " "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("salary") + "manat "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("profession") + " "); //Print one element of a row
                out.println("</td>");
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
                out.println(products.getString("salary") + "manat "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("profession") + " "); //Print one element of a row
                out.println("</td>");
                out.println("</tr>");
                    }   
                }
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
    
    
    
%> 

<br>
<br>
</div>         
        
            <div id="content_bottom"></div>
            <div id="footer"><h3><a href="http://www.bryantsmith.com"></a></h3></div>
      
            </div>
   </div>
   
</body>
</html>
