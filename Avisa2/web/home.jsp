<%-- 
    Document   : entries
    Created on : 14-feb-2012, 18:26:18
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
       
        <link rel="stylesheet/less" type="text/css" href="css/style.less">
        <script src="jscripts/lessmin.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            List<Entry> entries = (List<Entry>)session.getAttribute("entrylist");
                if(entries==null){
                    %>
                    <jsp:forward page='controller'>
                    <jsp:param name='action' value='chargeentries' />
                    </jsp:forward>
        <%       
                    }else{
             %>
             
     
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
                <%
                List<Entry> entrylist = (List<Entry>)session.getAttribute("entrylist");
                if(entrylist==null){
                    out.println("<jsp:forward page='controller'><jsp:param name='action' value='chargeentries' /></jsp:forward>");
                }
                int nentries= Integer.parseInt((String)session.getAttribute("nentries"));
                int i= 0;
                for(Entry e : entrylist){
                    if(i>=nentries){
                        break;
                    }
                    i++;
        out.println("<div id='entry'><a href='controller?action=seeentry&identry="+e.getId()+"'><h1 id='entrytitle'>"+e.getTitle()+
        "</h1></a><div id='entrycontent'>"+e.getContent()+
                "</div><div id='entrycreated'><b>Creado: </b>"+e.getCreated()+
                "</div><div id='entryauthor'><b>Autor: </b>"+e.getAuthor().getName()+"</div></div>");
               }
                           
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
                               }
                %>
                <% 
                String refresh=null;
                session.setAttribute("entrylist", refresh);%>
        </div>
        </div>
    </body>
</html>
