<%-- 
    Document   : newmessages.jsp
    Created on : 31.01.2014, 15:15:26
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
            String user=null; 
            user=(String) session.getAttribute("username");
            
            
            
            
            String dbURL="jdbc:mysql://localhost:3306/test";
                String dbusername="root";
                String dbpassword="root";
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                        dbURL,dbusername,dbpassword);
           
       
          String query="select *  from messages where to_user='"+user+"' and ifread='not_read'";
           //out.println(query);
           Statement statement=connection.createStatement();
            ResultSet products = statement.executeQuery(query);
            
          
           
          ResultSetMetaData rsmd = products.getMetaData();
           int columnsNumber;
               columnsNumber = rsmd.getColumnCount();
              // out.println(columnsNumber);
          if(!products.next())
           {
           out.println("<h1>Yeni mesaj yxodur<h1>");
           }
          else
          {
           // Iterate through the data in the result set and display it. 
            out.println("<table border='1' id='customers'>");
            out.println("<tr class='alt'>");
            out.println("<th>Kimdən</th>");
            out.println("<th>Mesaj</th>");
            out.println("</tr>");
             out.println("<tr>");
                out.println("<td>");
                out.println(products.getString("from_user") + " "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("message") + " "); //Print one element of a row
                out.println("</td>");
                out.println("</tr>");
            while (products.next()) {
            //Print one row          
            for(int i = 1 ; i <= columnsNumber/4; i++){
                out.println("<tr>");
                out.println("<td>");
                out.println(products.getString("from_user") + " "); //Print one element of a row
                out.println("</td>");
                out.println("<td>");
                out.println(products.getString("message") + " "); //Print one element of a row
                out.println("</td>");
                out.println("</tr>");
                }
            }
            String newquery="UPDATE messages SET ifread='read'WHERE to_user='"+user+"'";
            int rowcount=statement.executeUpdate(newquery);
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
