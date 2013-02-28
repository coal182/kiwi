/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author aula1-15
 */
public class UsersMySQLi implements UserInterface{
    
        @Override
    public void newUser(User u) {
         BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
        String sql="INSERT INTO user (alias, password, name, usertype) VALUES "+
                "('"+u.getAlias()+"',"+
                "'"+u.getPassword()+"', "+
                "'"+u.getName()+"', "+
                "'"+u.getUsertype()+
                "')";
                System.out.println(sql);
                
        bd.Ejecuta(sql);
        bd.cerrarBaseDatos();
    }

    @Override
    public void editUser(User u) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
        String sql;
        int id=u.getId();  
        
        sql = "UPDATE user SET iduser="+
                u.getId()+", "+"alias="+"'"+u.getAlias()+"'"+", "+
                "password="+"'"+u.getPassword()+"'"+", "+
                "name="+"'"+u.getName()+"'"+", "+
                "usertype="+"'"+u.getUsertype()+"'"+

                " WHERE iduser="+id+" ";          
 
                
            System.out.println(sql);            
            bd.Ejecuta(sql);
            bd.cerrarBaseDatos();
    }

    @Override
    public void deleteUser(User u) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
        String sql;  
        
        sql = "DELETE FROM user WHERE iduser="+u.getId();          
            
            System.out.println(sql);            
            bd.Ejecuta(sql);
            bd.cerrarBaseDatos();
    }

    @Override
    public List<User> getUsers() {
        List<User> lista = new ArrayList<User>();
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
           String sql="SELECT * FROM user";
            ResultSet rs = bd.Select(sql);
        try {
        
            while (rs.next() ){
                int id = rs.getInt("iduser");
                String alias = rs.getString("alias");
                String name = rs.getString("name");
                String usertype = rs.getString("usertype");
                                   
                User usr = new User(id,alias,name,usertype);
                
                lista.add(usr);
            
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersMySQLi.class.getName()).log(Level.SEVERE, null, ex);
        }                   
            bd.cerrarBaseDatos();

            return lista;
    }

    
    @Override
    public List<User> getUsersFull() {
        List<User> lista = new ArrayList<User>();
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
           String sql="SELECT * FROM user";
            ResultSet rs = bd.Select(sql);
        try {
        
            while (rs.next() ){
                int id = rs.getInt("iduser");
                String alias = rs.getString("alias");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String usertype = rs.getString("usertype");
                                   
                User usr = new User(id,alias,password,name,usertype);
                
                lista.add(usr);
            
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersMySQLi.class.getName()).log(Level.SEVERE, null, ex);
        }                   
            bd.cerrarBaseDatos();

            return lista;
    }
    

    @Override
    public User getUser(int id) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
        User usr=null;
        try {
            
               String sql="SELECT * FROM user WHERE iduser="+id;
                ResultSet rs = bd.Select(sql);
                if(rs.next()){
                id = rs.getInt("iduser");
                String alias = rs.getString("alias");
                String password = rs.getString("password");
                System.err.println("sql: "+password);
                String name = rs.getString("name");
                String usertype = rs.getString("usertype");
                
                usr = new User(id,alias,password,name,usertype);
                }

        } catch (SQLException ex) {
            Logger.getLogger(UsersMySQLi.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("ERROR en UsersMySQLi getUser");
            
        }finally{
            bd.cerrarBaseDatos();
        }
        return usr;
    }
    
    @Override
    public User getUser(String alias) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
        User usr=null;
        try {
            
               String sql="SELECT * FROM user WHERE alias='"+alias+"'";
               System.err.println(sql);
                ResultSet rs = bd.Select(sql);
                if(rs.next()){
                int id = rs.getInt("iduser");
                alias = rs.getString("alias");
                String password = rs.getString("password");
                System.err.println("sql: "+password);
                String name = rs.getString("name");
                String usertype = rs.getString("usertype");
                
                usr = new User(id,alias,password,name,usertype);
                }

        } catch (SQLException ex) {
            Logger.getLogger(UsersMySQLi.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("ERROR en UsersMySQLi getUser");
            
        }finally{
            bd.cerrarBaseDatos();
        }
        return usr;
    }
    
}
