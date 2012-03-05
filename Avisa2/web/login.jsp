<%-- 
    Document   : login
    Created on : 16-feb-2012, 10:38:23
    Author     : aula1-15
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/reset-mayer.css" rel="stylesheet" title="default" type="text/css" />
        <link href="css/login.css" rel="stylesheet" title="default" type="text/css" />
    </head>
    <body>
        <% 
        if(request.getParameter("error")!=null){
            out.println(request.getParameter("error"));
        }
               out.println("Login: ");
        %>
        <div id="form">
        <form action="controller" method="POST">
            <label for="username">User: </label>
            <input type="text" name="username" size="15" maxlength="15" required />
            <label for="username">Password: </label>
            <input type="password" name="userpassword" size="15" maxlength="15" required />
            <input type="submit" value="Login" />
            <input type="hidden" name="action" value="login" />
        </form>
        </div>
    </body>
</html>
