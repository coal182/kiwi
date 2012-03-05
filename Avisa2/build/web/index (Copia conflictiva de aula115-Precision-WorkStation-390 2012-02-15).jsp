<%-- 
    Document   : index
    Created on : 14-feb-2012, 12:29:30
    Author     : aula1-15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avisa2 - Home</title>
    </head>
    <body>
        <div id="header">
            <div id="banner"></div>
        </div>
        
        <div id="main">
            <div id="bar"></div>
            <div id="content">
                <% 
                String entrytitle = "Avisa2 se renueva";
                String entrycontent = "<h2>Avisa2 se renueva</h2><p>Hemos migrado avisa2 a un servidor con JSP y mysql diseñado por el principal autor, Cristian Martín.</p>";
                
                out.println("<div id='entry'><h1 id='entrytitle'>"+entrytitle+
        "</h1><div id='entrycontent'>"+entrycontent+"</div></div>");
%>
            </div>
        </div>
    </body>
</html>
