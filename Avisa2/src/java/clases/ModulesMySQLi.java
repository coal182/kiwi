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
public class ModulesMySQLi implements ModuleInterface{

    @Override
    public void newModule(Module m) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
        String sql="INSERT INTO module (`name`, `description`, `code`, `position`, `activity`, `order`) VALUES "+
                "('"+m.getName()+"',"+
                "'"+m.getDescription()+"', "+
                "'"+m.getCode()+"', "+
                "'"+m.getPosition()+"', "+
                ""+m.getActivity()+", "+
                ""+m.getOrder()+
                ")";
                System.out.println(sql);
                
        bd.Ejecuta(sql);
        bd.cerrarBaseDatos();
    }

    @Override
    public void editModule(Module m) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
        String sql;
        int id=m.getId();  
        
        sql = "UPDATE module SET idmodule="+
                m.getId()+", "+"`name`="+"'"+m.getName()+"'"+", "+
                "`description`="+"'"+m.getDescription()+"'"+", "+
                "`code`="+"'"+m.getCode()+"'"+", "+
                "`position`="+"'"+m.getPosition()+"'"+", "+
                "`activity`="+"'"+m.getActivity()+"'"+", "+
                "`order`="+"'"+m.getOrder()+"'"+

                " WHERE idmodule="+id+" ";          
 
                
            System.out.println(sql);            
            bd.Ejecuta(sql);
            bd.cerrarBaseDatos();
    }

    @Override
    public void deleteModule(Module m) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
        String sql;  
        
        sql = "DELETE FROM module WHERE idmodule="+m.getId();          
            
            System.out.println(sql);            
            bd.Ejecuta(sql);
            bd.cerrarBaseDatos();
    }

    @Override
    public List<Module> getModules() {
        List<Module> lista = new ArrayList<Module>();
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
           String sql="SELECT * FROM module ORDER BY `order` ASC";
            ResultSet rs = bd.Select(sql);
        try {
        
            while (rs.next() ){
                int id = rs.getInt("idmodule");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String code = rs.getString("code");
                String position = rs.getString("position");
                int activity = rs.getInt("activity");
                int order = rs.getInt("order");
                
                                   
                Module mod = new Module(id, name, description, code, position, activity, order);
                
                lista.add(mod);
            
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersMySQLi.class.getName()).log(Level.SEVERE, null, ex);
        }                   
            bd.cerrarBaseDatos();

            return lista;
    }

    @Override
    public Module getModule(int id) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
        Module mod=null;
        try {
            
               String sql="SELECT * FROM module WHERE idmodule="+id;
                ResultSet rs = bd.Select(sql);
                if(rs.next()){
                String name = rs.getString("name");
                String description = rs.getString("description");
                String code = rs.getString("code");
                String position = rs.getString("position");
                int activity = rs.getInt("activity");
                int order = rs.getInt("order");
                
                mod = new Module(id, name, description, code, position, activity, order);
                }

        } catch (SQLException ex) {
            Logger.getLogger(ModulesMySQLi.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("ERROR en ModulesMySQLi getUser");
            
        }finally{
            bd.cerrarBaseDatos();
        }
        return mod;
    }
    
}
