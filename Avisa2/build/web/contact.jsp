<%-- 
    Document   : contact
    Created on : 22-feb-2012, 18:26:18
    Author     : Cristian Martín
--%>

<%@page import="clases.Module"%>
<%@page import="clases.Entry"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <link href="css/reset-mayer.css" rel="stylesheet" title="default" type="text/css" />
        <link rel="stylesheet/less" type="text/css" href="css/style.less">
        <script src="jscripts/lessmin.js" type="text/javascript"></script>
    </head>
    <body>
        
        <div id="container">
        <div id="header">
            <div id="banner"></div>
            <%
                List<Module> headermodules = (List<Module>)session.getAttribute("headermodules");
                if(headermodules==null){
                    out.println("");
                }
                for(Module m : headermodules){
                    if(m.getActivity()==1){
                    out.println("<div id='headermodule'>"+m.getCode()+"</div>");
                    }
                }
                %>
        </div>
        
        <div id="main">
            <div id="nav">
                <%
                List<Module> navmodules = (List<Module>)session.getAttribute("navmodules");
                if(navmodules==null){
                    out.println("");
                }
                for(Module m : navmodules){
                    if(m.getActivity()==1){
                    out.println("<div id='navmodule'>"+m.getCode()+"</div>");
                    }
                }
                %>
            </div>
            <div id="content">
                <%
                List<Module> contentmodules = (List<Module>)session.getAttribute("contentmodules");
                if(contentmodules==null){
                    out.println("");
                }
                for(Module m : contentmodules){
                    if(m.getActivity()==1){
                    out.println("<div id='contentmodule'>"+m.getCode()+"</div>");
                    }
                }
                %>
                
                <form action="controller?action=sendmail" method="post" id="contact"><fieldset><legend>Datos de contacto</legend>   
                    <table>
                        <tr>
                            <td><label for="name">Nombre y apellidos : </label></td>
                            <td><input type="text" name="name" size="30" maxlength="80"></td>
                        </tr>
                        <tr>
                            <td><label for="email">Email : </label></td>
                            <td><input type="text" name="email" size="30" maxlength="60"></td>
                        </tr>
                        <tr>
                            <td><label for="tlf">Teléfono : </label></td>
                            <td><input type="text" name="tlf" size="30" maxlength="60"></td>
                        </tr>
                        <tr>
                            <td><label for="subject">Asunto : </label></td>
                            <td><input type="text" name="subject" size="30" maxlength="60"></td>
                        </tr>
                        <tr>
                            <td><label for="message">Mensaje : </label></td>
                            <td><textarea name="message" cols="41" rows="5"></textarea></td>
                        </tr>
                    </table>

            </fieldset>
            <label for="send">
            <input type="submit" name="send" value="Enviar datos"></label>
            </form>
          </div>
            <div class="clean"></div>
        </div>
        <div id="footer">
            
            <%
                List<Module> footermodules = (List<Module>)session.getAttribute("footermodules");
                if(footermodules==null){
                    out.println("");
                }
                for(Module m : footermodules){
                    if(m.getActivity()==1){
                    out.println("<div id='footermodule'>"+m.getCode()+"</div>");
                    }
                }
                               
                %>
        </div>
        </div>
        <link href="css/style.css" rel="stylesheet" title="default" type="text/css" />
    </body>
</html>