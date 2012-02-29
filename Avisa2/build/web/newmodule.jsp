<%-- 
    Document   : newmodule
    Created on : 27-feb-2012, 14:10:17
    Author     : aula1-15
--%>

<%@page import="clases.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Module</title>
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
		<a id="btnpanel" href="backend.jsp"><h1>Kiwi: Control Panel</h1></a>
		<a id="btnver" href="index.jsp">See Page</a>
		<span id="welcomeuser">
                    <%
                    User user = (User)session.getAttribute("user");
                    out.println("Welcome <b>"+user.getName()+"</b>");%>
                    <a href="controller?action=exit">Exit</a>
                </span>	
            </div>
            <div id="body">
		<div id="title">
                    <a id="btnnew" href="newmodule.jsp">New Module</a>	
			<h2>New Module</h2>				
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
                    <form method="post" action="controller" id="wysiwyg">
			<label for="modulename">Module Name</label>
			<input id="modulename" name="modulename" type="text" size="40"></input>
                    <br /><br />
                    <label for="moduledescription">Module Description</label>
                        <textarea id="moduledescription" name="moduledescription" rows="5" cols="80">
                            
                        </textarea>
                    <br /><br />
                        <label for="modulecode">Module Code</label>
                        <textarea id="modulecode" name="modulecode" rows="10" cols="80">
                            
                        </textarea>
                    <br /><br />
                    <label for="moduleposition">Module Position</label>
                    <select id="moduleposition" name="moduleposition">
                        <option>Top</option>
                        <option>Right</option>
                        <option>Left</option>
                        <option>Bottom</option>
                    </select>
                    <br /><br />
                    <input type="radio" id="moduleactivity" name="moduleactivity" value="1"> Enabled
                    <br />
                    <input type="radio" id="moduleactivity" name="moduleactivity" value="0"> Disabled
                    <br /><br />
                    Order: <input type="text" id="moduleorder" name="moduleorder" value="1" />
                    

                        
	<br />
        <input type="hidden" name="action" value="newmodule" />
	<input type="submit" name="save" value="Save" />
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
