<%-- 
    Document   : entries
    Created on : 14-feb-2012, 18:26:18
    Author     : usuario
--%>

<%@page import="clases.Entry"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="css/reset-mayer.css" rel="stylesheet" title="default" type="text/css" />
        <link href="css/style.css" rel="stylesheet" title="default" type="text/css" />
    </head>
    <body>
        <div id="container">
        <div id="header">
            <div id="banner"><h1>AVISA2</h1></div>
        </div>
        
        <div id="main">
            <div id="bar">
                <div id="form">
                    <form action="controller" method="POST">
                        <table>
                            <tr>
                                <td><label for="username">User: </label></td>
                                <td><input type="text" name="username" size="15" maxlength="15" required /></td>
                            </tr>
                            <tr>
                                <td><label for="username">Password: </label></td>
                                <td><input type="password" name="userpassword" size="15" maxlength="15" required /></td>
                            </tr>
                            <tr>
                                <td><input type="hidden" name="action" value="login" /></td>
                                <td><input type="submit" value="Login" /></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <a href="backend.jsp">Backend</a> 
                <a href="home.jsp">Home</a>
            </div>
            <div id="content">
                
                <%
                List<Entry> entrylist = (List<Entry>)session.getAttribute("entrylist");
                if(entrylist==null){
                    out.println("<jsp:forward page='controller'><jsp:param name='action' value='chargeentries' /></jsp:forward>");
                }
                for(Entry e : entrylist){
       
        out.println("<div id='entry'><a href='controller?action=seeentry&identry="+e.getId()+"'><h1 id='entrytitle'>"+e.getTitle()+
        "</h1></a><div id='entrycontent'>"+e.getContent()+
                "</div><div id='entrycreated'><b>Creado: </b>"+e.getCreated()+
                "</div><div id='entryauthor'><b>Autor: </b>"+e.getAuthor().getName()+"</div></div>");
               }
        %>
            </div>
            <div class="clean"></div>
        </div>
        <div id="footer"></div>
        </div>
    </body>
</html>
