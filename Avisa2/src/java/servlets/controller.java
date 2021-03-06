/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import clases.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author usuario
 */
@WebServlet(name = "controller", urlPatterns = {"/controller"})
public class controller extends HttpServlet {
    /**
     * Creamos los objetos que implementan las interfaces:
     */
    EntryInterface manageentry = new EntriesMySQLi();
    UserInterface manageuser = new UsersMySQLi();
    ModuleInterface managemodule = new ModulesMySQLi();
    SettingInterface managesettings = new SettingsMySQL();
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            String action = request.getParameter("action");
            int identry = 0;

             /**
             * Recepción de parámetros y acciones a realizar dependiendo del 
             * parámetro recibido
             */
            /**
             * -------------------------------GESTION ENTRADAS------------------
             */
            /**
             * Login
             */
            if(action.equals("login")){
                String alias="";
                String password="";

                if (request.getParameter("username") != null){
                    alias = request.getParameter("username");
                }
                if (request.getParameter("userpassword") != null){
                    password = request.getParameter("userpassword");
                }
                System.err.println("request getparameter alias: "+request.getParameter("alias"));
                System.err.println("request alias: "+alias);
                System.err.println("request pass: "+password);
                List<User> userlist = manageuser.getUsersFull();
                User user=null;
                for(User u : userlist){
                    System.err.println("ALIAS:" +u.getAlias());
                    System.err.println("ALIAS:" +u.getPassword());
                    
                    if (u.getAlias().equals(alias) && u.getPassword().equals(password)){
                        user=u;
                    }           
                }
                if(user!=null){
                request.getSession().setAttribute("user", user); 
            
                response.sendRedirect("backend.jsp");
                }else{
                     
                    response.sendRedirect("login.jsp?error='Login Error'");
                }
                
                /*
                User u = manageuser.getUser(alias);
                System.err.println(u.getPassword());
                if(u!= null){
                    if(password.equals(u.getPassword())){
                        request.getSession().setAttribute("username", alias);
                        request.getSession().setAttribute("username", password);
                        response.sendRedirect("backend.jsp");
                    }else{
                        response.sendRedirect("login.jsp?login=password");
                    }
                }else{
                    response.sendRedirect("login.jsp?login=user");
                }*/
                
            /**
             * Salir, cerrar sesion
             */    
            }else if(action.equals("exit")){
                
                request.getSession().invalidate();
                response.sendRedirect("login.jsp?error=seeyou");
            
            /**
             * Nueva Entrada
             */
            }else if(action.equals("newentry")){
                
                String title = request.getParameter("entrytitle");
                String content = request.getParameter("elm4");
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                Date created= new java.sql.Timestamp(date.getTime());
                int idauthor = Integer.parseInt(request.getParameter("entryauthor"));
                System.out.println(idauthor);
                User user = null;               
                user = manageuser.getUser(idauthor);              
                Entry e = new Entry(title, content, user, created);               
                manageentry.newEntry(e);
                List<Entry> entrylist = manageentry.getEntries();
                request.getSession().setAttribute("entrylistback", entrylist);
                response.sendRedirect("index.jsp");
            
            /**
             * Cargar Entradas en HOME
             */
            }else if(action.equals("chargeentries")){      
                List<Entry> entrylist = manageentry.getEntries();
                request.getSession().setAttribute("entrylist", entrylist);
                List<Module> headermodules = managemodule.getModules("header");
                List<Module> navmodules = managemodule.getModules("nav");
                List<Module> contentmodules = managemodule.getModules("content");
                List<Module> footermodules = managemodule.getModules("footer");
                String nentries = managesettings.getSetting("nentries").getValue();
                request.getSession().setAttribute("nentries", nentries);
                request.getSession().setAttribute("headermodules", headermodules);
                request.getSession().setAttribute("navmodules", navmodules);
                request.getSession().setAttribute("contentmodules", contentmodules);
                request.getSession().setAttribute("footermodules", footermodules);
                response.sendRedirect("home.jsp");

            /**
             * Cargar Entradas en BACKEND
             */
            }else if(action.equals("chargeentrieslist")){ 
                
                List<Entry> entrylist = manageentry.getEntries();
                request.getSession().setAttribute("entrylistback", entrylist);
                response.sendRedirect("entries.jsp");
            
            /**
             * Borrar Entrada
             */    
            }else if(action.equals("deleteentry")){ 

                identry=Integer.parseInt(request.getParameter("identry"));
                Entry ent = manageentry.getEntry(identry);
                manageentry.deleteEntry(ent);

                List<Entry> entrylist = manageentry.getEntries();
                request.getSession().setAttribute("entrylistback", entrylist);
                request.getSession().setAttribute("entrylist", entrylist);
                response.sendRedirect("entries.jsp");
            
            /**
             * Cargar Entrada en Editar Entrada
             */    
            }else if(action.equals("editentry")){ 
                
                identry=Integer.parseInt(request.getParameter("identry"));
                Entry ent = manageentry.getEntry(identry);
            
                String title = ent.getTitle();
                String content = ent.getContent();
                Date created = ent.getCreated();
                String author = ent.getAuthor().getName();
                int id = ent.getId();
                request.getSession().setAttribute("editentryid", id);
                request.getSession().setAttribute("editentrytitle", title);
                request.getSession().setAttribute("editentrycontent", content);
                request.getSession().setAttribute("editentrycreated", created);
                request.getSession().setAttribute("editentryauthor", author);
                response.sendRedirect("editentry.jsp");
            
            /**
             * Actualizar / Editar / Modificar Entrada
             */
            }else if(action.equals("updateentry")){                                         
                
                int id = Integer.parseInt(request.getParameter("identry"));
                String title = request.getParameter("entrytitle");
                String content = request.getParameter("elm4");

                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                Date created= new java.sql.Timestamp(date.getTime());
                int idauthor = Integer.parseInt(request.getParameter("idauthor"));
                System.out.println(idauthor);
                User user = null;               
                user = manageuser.getUser(idauthor);              
                Entry e = new Entry(id,title, content, user, created);               
                
                manageentry.editEntry(e);

                List<Entry> entrylist = manageentry.getEntries();
                request.getSession().setAttribute("entrylistback", entrylist);
                request.getSession().setAttribute("entrylist", entrylist);
                response.sendRedirect("entries.jsp");
            
            }else if(action.equals("seeentry")){ 

                identry=Integer.parseInt(request.getParameter("identry"));
                Entry ent = manageentry.getEntry(identry);
                
                List<Module> headermodules = managemodule.getModules("header");
                List<Module> navmodules = managemodule.getModules("nav");
                List<Module> contentmodules = managemodule.getModules("content");
                List<Module> footermodules = managemodule.getModules("footer");
                request.getSession().setAttribute("headermodules", headermodules);
                request.getSession().setAttribute("navmodules", navmodules);
                request.getSession().setAttribute("contentmodules", contentmodules);
                request.getSession().setAttribute("footermodules", footermodules);
                
                request.getSession().setAttribute("entry", ent);
                response.sendRedirect("entry.jsp");
            /**
             * FIN GESTION ENTRADAS---------------------------------------------
             */
            /**
             *GESTION USUARIOS / LOGIN------------------------------------------
             */
            /**
             * Cargar Lista Usuarios
             */    
            }else if(action.equals("chargeuserlist")){ 
                
                List<User> userlist = manageuser.getUsers();
                request.getSession().setAttribute("userlistback", userlist);
                response.sendRedirect("users.jsp");
            
            /**
             * 
             */    
            }else if(action.equals("newuser")){
                
                String alias = request.getParameter("newalias");
                String name = request.getParameter("newname");
                String password = request.getParameter("newpassword");
                String usertype = request.getParameter("newusertype");
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                Date registered= new java.sql.Timestamp(date.getTime());
            
                User u = new User(alias, password, name, usertype);  
                u.setRegistered(registered);
                manageuser.newUser(u);
                List<User> userlist = manageuser.getUsers();
                request.getSession().setAttribute("userlistback", userlist);
                response.sendRedirect("users.jsp");
            
            /**
             * Borrar Usuario
             */
            }else if(action.equals("deleteuser")){ 

                int iduser=Integer.parseInt(request.getParameter("iduser"));
                User usr = manageuser.getUser(iduser);
                manageuser.deleteUser(usr);

                List<User> userlist = manageuser.getUsers();
                request.getSession().setAttribute("userlistback", userlist);
                response.sendRedirect("users.jsp");
            
            /**
             * Cargar Usuario en Editar Usuario
             */    
            }else if(action.equals("edituser")){ 
                
                int iduser=Integer.parseInt(request.getParameter("iduser"));
                User usr = manageuser.getUser(iduser);
            
                String alias = usr.getAlias();
                String name = usr.getName();
                String password = usr.getPassword();
                String usertype = usr.getUsertype();
                System.err.println("controlador: "+usertype);
                request.getSession().setAttribute("edituserid", iduser);
                request.getSession().setAttribute("edituseralias", alias);
                request.getSession().setAttribute("editusername", name);
                request.getSession().setAttribute("edituserpassword", password);
                request.getSession().setAttribute("editusertype", usertype);
                response.sendRedirect("edituser.jsp");
            
            /**
             * Actualizar / Editar / Modificar Entrada
             */
            }else if(action.equals("updateuser")){                                         
                
                int id = Integer.parseInt(request.getParameter("iduser"));
                String alias = request.getParameter("edituseralias");
                String name = request.getParameter("editusername");
                String password = request.getParameter("edituserpassword");
                String usertype=request.getParameter("editusertype");
                
                User u = new User(id, alias, password, name, usertype);               
                
                manageuser.editUser(u);

                List<User> userlist = manageuser.getUsers();
                request.getSession().setAttribute("userlistback", userlist);
                response.sendRedirect("users.jsp");
            
             /**
             * FIN GESTION USUARIOS---------------------------------------------
             */
             /**
             *GESTION MODULOS------------------------------------------
             */
            /**
             * Cargar Lista Modulos
             */    
            }else if(action.equals("chargemoduleslist")){ 
                
                List<Module> moduleslist = managemodule.getModules();
                request.getSession().setAttribute("moduleslistback", moduleslist);
                response.sendRedirect("modules.jsp");
            
            /**
             * 
             */    
            }else if(action.equals("newmodule")){
                
                String name = request.getParameter("modulename");
                String description = request.getParameter("moduledescription");
                String code = request.getParameter("modulecode");
                code = code.replace("'", "''");
                String position = request.getParameter("moduleposition");
                int activity = Integer.parseInt(request.getParameter("moduleactivity"));
                int order = Integer.parseInt(request.getParameter("moduleorder"));
                Module m = new Module(name, description, code, position, activity, order);  
                managemodule.newModule(m);
                List<Module> moduleslist = managemodule.getModules();
                request.getSession().setAttribute("moduleslistback", moduleslist);
                response.sendRedirect("modules.jsp");
            
            /**
             * Borrar Modules
             */
            }else if(action.equals("deletemodule")){ 

                int idmodule=Integer.parseInt(request.getParameter("idmodule"));
                Module mod = managemodule.getModule(idmodule);
                managemodule.deleteModule(mod);

                List<Module> moduleslist = managemodule.getModules();
                request.getSession().setAttribute("moduleslistback", moduleslist);
                response.sendRedirect("modules.jsp");
            
            /**
             * Cargar Modulos en Editar Modulos
             */    
            }else if(action.equals("editmodule")){ 
                
                int idmodule=Integer.parseInt(request.getParameter("idmodule"));
                Module mod = managemodule.getModule(idmodule);
            
                String name = mod.getName();
                String description = mod.getDescription();
                String code = mod.getCode();
                code = code.replace("'", "''");
                String position = mod.getPosition();
                int activity = mod.getActivity();
                int order = mod.getOrder();
                request.getSession().setAttribute("editmoduleid", idmodule);
                request.getSession().setAttribute("editmodulename", name);
                request.getSession().setAttribute("editmoduledescription", description);
                request.getSession().setAttribute("editmodulecode", code);
                request.getSession().setAttribute("editmoduleposition", position);
                request.getSession().setAttribute("editmoduleactivity", activity);
                request.getSession().setAttribute("editmoduleorder", order);
                response.sendRedirect("editmodule.jsp");
            
          
            }else if(action.equals("enablemodule")){ 
                int idmodule=Integer.parseInt(request.getParameter("idmodule"));
                Module mod = managemodule.getModule(idmodule);
                int activity = mod.getActivity();
                int newactivity= 1;
                mod.setActivity(newactivity);
                String code = mod.getCode();
                code = code.replace("'", "''");
                mod.setCode(code);
                managemodule.editModule(mod);
                List<Module> moduleslist = managemodule.getModules();
                request.getSession().setAttribute("moduleslistback", moduleslist);
                response.sendRedirect("modules.jsp");
                
            }else if(action.equals("disablemodule")){ 
                int idmodule=Integer.parseInt(request.getParameter("idmodule"));
                Module mod = managemodule.getModule(idmodule);
                int activity = mod.getOrder();
                int newactivity= 0;
                System.out.println("Nuevo orden: "+newactivity);
                mod.setActivity(newactivity);
                String code = mod.getCode();
                code = code.replace("'", "''");
                mod.setCode(code);
                managemodule.editModule(mod);
                List<Module> moduleslist = managemodule.getModules();
                request.getSession().setAttribute("moduleslistback", moduleslist);
                response.sendRedirect("modules.jsp");
                
            }else if(action.equals("upmodule")){ 
                int idmodule=Integer.parseInt(request.getParameter("idmodule"));
                Module mod = managemodule.getModule(idmodule);
                int order = mod.getOrder();
                int neworder= order-1;
                mod.setOrder(neworder);
                String code = mod.getCode();
                code = code.replace("'", "''");
                mod.setCode(code);
                managemodule.editModule(mod);
                List<Module> moduleslist = managemodule.getModules();
                request.getSession().setAttribute("moduleslistback", moduleslist);
                response.sendRedirect("modules.jsp");
                
            }else if(action.equals("downmodule")){ 
                int idmodule=Integer.parseInt(request.getParameter("idmodule"));
                Module mod = managemodule.getModule(idmodule);
                int order = mod.getOrder();
                int neworder= order+1;
                mod.setOrder(neworder);
                String code = mod.getCode();
                code = code.replace("'", "''");
                mod.setCode(code);
                managemodule.editModule(mod);
                List<Module> moduleslist = managemodule.getModules();
                request.getSession().setAttribute("moduleslistback", moduleslist);
                response.sendRedirect("modules.jsp");
                
            }else if(action.equals("updatemodule")){                                         
                int id = Integer.parseInt(request.getParameter("moduleid"));
                System.out.println("id: "+id);
                String name = request.getParameter("modulename");
                String description = request.getParameter("moduledescription");
                String code = request.getParameter("modulecode");
                String position = request.getParameter("moduleposition");
                int activity = Integer.parseInt(request.getParameter("moduleactivity"));
                int order = Integer.parseInt(request.getParameter("moduleorder"));
                
                Module m = new Module(id, name, description, code, position, activity, order);               
                
                managemodule.editModule(m);

                List<Module> moduleslist = managemodule.getModules();
                request.getSession().setAttribute("moduleslistback", moduleslist);
                response.sendRedirect("modules.jsp");
            }else if(action.equals("chargemodules")){
                List<Module> headermodules =managemodule.getModules("header");
                List<Module> navmodules =managemodule.getModules("nav");
                List<Module> contentmodules =managemodule.getModules("content");
                List<Module> footermodules =managemodule.getModules("footer");
                request.getSession().setAttribute("headermodules", headermodules);
                request.getSession().setAttribute("navmodules", navmodules);
                request.getSession().setAttribute("contentmodules", contentmodules);
                request.getSession().setAttribute("footermodules", footermodules);
                response.sendRedirect("home.jsp");
            }else if(action.equals("chargesettings")){
                List<Setting> settinglist = managesettings.getSettings();
                request.getSession().setAttribute("settinglist", settinglist);
                response.sendRedirect("settings.jsp");
            }else if(action.equals("updatesettings")){
                int settingid = Integer.parseInt(request.getParameter("settingid"));
                String settingname = request.getParameter("settingname");
                String settingvalue = request.getParameter("settingvalue");
                Setting set = new Setting(settingid, settingname, settingvalue);
                managesettings.editSetting(set);
                response.sendRedirect("controller?action=chargesettings");
                
            }else if(action.equals("sendmail")){
                int settingid = Integer.parseInt(request.getParameter("settingid"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String tlf = request.getParameter("tlf");
                String subject = request.getParameter("subject");
                String message = request.getParameter("message");
                
                
                response.sendRedirect("contacto.jsp?state=sent");
            }    
            
            
            
            
            
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
