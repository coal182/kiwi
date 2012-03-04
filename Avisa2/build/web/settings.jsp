<%-- 
    Document   : settings
    Created on : 15-feb-2012, 13:34:56
    Author     : Cristian Martín
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Setting"%>
<%@page import="clases.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Panel</title>
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
<%
            List<Setting> settinglist = (List<Setting>)session.getAttribute("settinglist");
                if(settinglist==null){
                    %>
                    <jsp:forward page='controller'>
                    <jsp:param name='action' value='chargesettings' />
                    </jsp:forward>
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
                    <a id="btnnew" href="newentry.jsp">New Entry</a>	
			<h2>Settings</h2>				
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
                        <form action="controller?action=updatesettings" method="post">
                            
                    <%
                    for(Setting s : settinglist){
                        if(s.getName().equals("nentries")){
                           out.println("<label for='nentries'>Nº Entries in Home: </label>"+
                            "<input type='hidden' value='"+s.getId()+"' name='settingid' />"+       
                            "<input type='hidden' value='"+s.getName()+"' name='settingname' />"+
                            "<input type='text' name='settingvalue' id='nentries' size='3' maxlength='2'"+
                            " value='"+s.getValue()+"'/>");
                        }
                    }       
                    
                    %>
                    <input type="submit" value="Accept" />
                        </form>		
                    </div>
                    <div class="clean"></div>
                </div>
            
            <div id="footer">
			
            </div>		
	</div>
    </body>
</html>
