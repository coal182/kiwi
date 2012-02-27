<%-- 
    Document   : edituser
    Created on : 23-feb-2012, 10:00:49
    Author     : aula1-15
--%>

<%@page import="clases.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
        <link href="css/reset-mayer.css" rel="stylesheet" title="default" type="text/css" />
        <link href="css/backend.css" rel="stylesheet" title="default" type="text/css" />
    </head>
    <body>
        <% 
        if(session.getAttribute("user")==null){
        %>
        <jsp:forward page="login.jsp?error=You Must to Log" />
        <%       
        }
        %>        
        <div id="container">
            <div id="header">
		<a id="btnpanel" href="backend.jsp"><h1>Kiwi: Panel de control</h1></a>
		<a id="btnver" href="index.jsp">Ver Página</a>
		<span id="welcomeuser">
                    <%
                    User user = (User)session.getAttribute("user");
                    out.println("Welcome <b>"+user.getName()+"</b>");%>
                    <a href="controller?action=exit">Exit</a>
                </span>	
            </div>
            <div id="body">
		<div id="title">
                    <a id="btnnew" href="newuser.jsp">New user</a>	
			<h2>Edit User</h2>				
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
                    <form method="post" action="controller" id="edituser">
                        <input type="hidden" name="iduser" value="<%int userid=(Integer)session.getAttribute("edituserid");out.print(userid);%>" />
                        <table id="editusertable">
                            <tr>
                                <td><label for="edituseralias">Alias: </label></td>
                                <td><input id="edituseralias" name="edituseralias" type="text" size="20" value="<%
                        String useralias=(String)session.getAttribute("edituseralias");
                        out.println(useralias);
                        %>"></input></td>
                            </tr>
                            <tr>
                                <td><label for="edituserpassword">Password: </label></td>
                                <td><input id="edituserpassword" name="edituserpassword" type="password" size="20" value="<%
                        String userpassword=(String)session.getAttribute("edituserpassword");
                        out.println(userpassword);
                        %>"></input></td>
                            </tr>
                            <tr>
                                <td><label for="editusername">Name: </label></td>
                                <td><input id="editusername" name="editusername" type="text" size="20" value="<%
                        String username=(String)session.getAttribute("editusername");
                        out.println(username);
                        %>"></input></td>
                            </tr>
                            <tr>
                                <td><label for="editusertype">Usertype: </label></td>
                                <td>
                                    <select id="editusertype" name="editusertype">
                                        <%
                                        String usertype=(String)session.getAttribute("editusertype");
                                        if(usertype.equals("Admin")){
                                        out.println("<option selected>Admin</option>"+
                                        "<option>Author</option>"+
                                        "<option>Registered</option>");    
                                        }else if(usertype.equals("Author")){
                                        out.println("<option>Admin</option>"+
                                        "<option selected>Author</option>"+
                                        "<option>Registered</option>");     
                                        }else if(usertype.equals("Registered")){
                                        out.println("<option>Admin</option>"+
                                        "<option>Author</option>"+
                                        "<option selected>Registered</option>");     
                                        }
                                        %>
                                    </select>
                                    </td>
                            </tr>
                    </table>
                        
	<br />
        <input type="hidden" name="action" value="updateuser" />
	<input type="submit" name="save" value="Update" />
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
