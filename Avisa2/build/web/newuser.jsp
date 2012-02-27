<%-- 
    Document   : newuser
    Created on : 22-feb-2012, 10:22:49
    Author     : aula1-15
--%>

<%@page import="clases.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/reset-mayer.css" rel="stylesheet" title="default" type="text/css" />
        <link href="css/backend.css" rel="stylesheet" title="default" type="text/css" />
    </head>
    <body>    
        <div id="container">
            <div id="header">
		<a id="btnpanel" href="backend.jsp"><h1>Kiwi: Control Panel</h1></a>
		<a id="btnver" href="index.jsp">See Page</a>
		<span id="welcomeuser">
                    <%
                    if(session.getAttribute("user")!=null){
                    User user = (User)session.getAttribute("user");
                    out.println("Welcome <b>"+user.getName()+"</b>");
                    }%>
                    <a href="controller?action=exit">Exit</a>
                    
                </span>	
            </div>
            <div id="body">
		<div id="title">
                    <h3>New User</h3>
		</div>
		<div id="bar">
                    <ul>
			<li><a href="entries.jsp" id="firstmenu">Entries</a></li>
			<li><a href="pages.jsp">Pages</a></li>
			<li><a href="polls.jsp">Polls</a></li>	
			<li><a href="forms.jsp">Forms</a></li>
			<li><a href="users.jsp">Users</a></li>	
			<li><a href="modules.jsp">Modules</a></li>	
			<li><a href="templates.jsp">Templates</a></li>	
			<li><a href="settings.jsp" id="lastmenu">Settings</a></li>						
		</ul>				
		</div>
		<div id="content">
                    <form method="post" action="controller" id="newuser">
                        <table id="newusertable">
                            <tr>
                                <td><label for="newalias">Alias: </label></td>
                                <td><input id="newalias" name="newalias" type="text" size="20"></input></td>
                            </tr>
                            <tr>
                                <td><label for="newpassword">Password: </label></td>
                                <td><input id="newpassword" name="newpassword" type="text" size="20"></input></td>
                            </tr>
                            <tr>
                                <td><label for="newname">Name: </label></td>
                                <td><input id="newname" name="newname" type="text" size="20"></input></td>
                            </tr>
                            <tr>
                                <td><label for="newusertype">Usertype: </label></td>
                                <td><input id="newusertype" name="newusertype" type="text" size="20" value="Registered" readonly=""></input></td>
                            </tr>
                    </table>
                        
	<br />
        <input type="hidden" name="action" value="newuser" />
	<input type="submit" name="save" value="Create" />
	<input type="reset" name="reset" value="Reset" />
</form>

    							
				</div>
				<div class="clean"></div>
			</div>
			<div id="footer">
			
			</div>		
		</div>
    </body>
</html>
