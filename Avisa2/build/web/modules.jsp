<%-- 
    Document   : modules
    Created on : 27-feb-2012, 19:00:13
    Author     : usuario
--%>

<%@page import="clases.Module"%>
<%@page import="clases.User"%>
<%@page import="clases.Entry"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modules</title>
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
                    <a id="btnnew" href="newmodule.jsp">New Module</a>	
			<h2>Control Panel</h2>				
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
                	<table id="entrieslist">
            <%
            List<Module> moduleslist = (List<Module>)session.getAttribute("moduleslistback");
                if(moduleslist==null){
             %>
             <jsp:forward page='controller'>
                 <jsp:param name='action' value='chargemoduleslist' />
             </jsp:forward>;
             <%
                }else{
            for(Module m : moduleslist){
        int idmodule=m.getId();
        /*out.println("<tr><td>"+e.getTitle()+
        "</td><td id='buttons'><form action='controller' method='POST'>"+
                "<input type='hidden' name='action' value='editentry' /><input type='hidden' name='identry' value='"+identry+"' />"+
                "<input type='submit' value='Edit' /></form><form action='controller'>"+
                "<input type='hidden' name='action' value='deleteentry' /><input type='hidden' name='identry' value='"+identry+"' />"+
                "<input type='submit' value='Delete' /></form></td></tr>");*/
        out.println("<tr><td>"+m.getName()+
        "</td><td>Position: "+m.getPosition()+"<td>Activity: "+m.getActivity()+"</td>"+"<td>Order: "+m.getOrder()+
                "<a href='controller?action=downmodule&idmodule="+idmodule+"' id='downmodule'></a><a href='controller?action=upmodule&idmodule="+idmodule+"' id='upmodule'></a></td>"+
                "</td><td id='buttons'><a href='controller?action=deletemodule&idmodule="+idmodule+"' id='deleteentry'></a>"+
                "<a href='controller?action=editmodule&idmodule="+idmodule+"' id='editentry'></a></td></tr>");
               }
                       }
                    %>
        </table>		
                    </div>
                    <div class="clean"></div>
                </div>
            
            <div id="footer">
			
            </div>		
	</div>
        
    </body>
</html>
