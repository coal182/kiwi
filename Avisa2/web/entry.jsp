<%-- 
    Document   : entry
    Created on : 22-feb-2012, 18:26:18
    Author     : usuario
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
        <title>Home</title>
        <link href="css/reset-mayer.css" rel="stylesheet" title="default" type="text/css" />
        <link href="css/style.css" rel="stylesheet" title="default" type="text/css" />
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
                <a href="backend.jsp">Backend</a>
                <a href="home.jsp">Home</a>
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
                <%
                Entry e = (Entry)session.getAttribute("entry");
                
       
        out.println("<div id='entry'><h1 id='entrytitle'>"+e.getTitle()+
        "</h1><div id='entrycontent'>"+e.getContent()+
                "</div><div id='entrycreated'><b>Creado: </b>"+e.getCreated()+
                "</div><div id='entryauthor'><b>Autor: </b>"+e.getAuthor().getName()+"</div></div>");
                     
        %>
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