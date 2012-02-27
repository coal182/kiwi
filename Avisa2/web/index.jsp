<%-- 
    Document   : index
    Created on : 14-feb-2012, 12:29:30
    Author     : aula1-15
--%>

<%@page import="java.util.Date"%>
<%@page import="clases.UsersMySQLi"%>
<%@page import="clases.EntriesMySQLi"%>
<%@page import="clases.UserInterface"%>
<%@page import="clases.EntryInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avisa2 - Home</title>
        <link href="reset-mayer.css" rel="stylesheet" title="default" type="text/css" />
        <link href="style.css" rel="stylesheet" title="default" type="text/css" />
    </head>
    <body>
        <jsp:forward page="controller">
        <jsp:param name="action" value="chargeentries" />
        </jsp:forward>
        <div id="container">
        <div id="header">
            <div id="banner"></div>
        </div>
        
        <div id="main">
            <div id="bar">BAR</div>
            <div id="content">
                <form action="controller">
                    <input type="hidden" name="action" value="chargeentries"/>
                    <input type="submit" value="controller" />
                </form>
                <div class="clean"></div>
            </div>
            <div class="clean"></div>
        </div>
        <div id="footer"></div>
        </div>
    </body>
</html>
