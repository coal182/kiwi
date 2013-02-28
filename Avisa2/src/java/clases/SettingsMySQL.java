/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author usuario
 */
public class SettingsMySQL implements SettingInterface{

    @Override
    public void editSetting(Setting s) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
        String sql;
        int id=s.getId();  
        
        sql = "UPDATE settings SET idsetting="+
                s.getId()+", "+"name="+"'"+s.getName()+"'"+", "+
                "value="+"'"+s.getValue()+"'"+

                " WHERE idsetting="+id+" ";          
 
                
            System.out.println(sql);            
            bd.Ejecuta(sql);
            bd.cerrarBaseDatos();
    }

    @Override
    public Setting getSetting(String name) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
        Setting set = null;
        try {
            
               String sql="SELECT * FROM settings WHERE name='"+name+"'";
System.err.println(sql);
                ResultSet rs = bd.Select(sql);
                if(rs.next()){
                int id = rs.getInt("idsetting");
                name = rs.getString("name");
                String value = rs.getString("value");
                
                set = new Setting(id, name, value);
                }             
                
        } catch (SQLException ex) {
            Logger.getLogger(SettingsMySQL.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("ERROR en EntriesMySQLi");
            
        }finally{
            bd.cerrarBaseDatos();
        }
        return set;
    }

    @Override
    public List<Setting> getSettings() {
        List<Setting> lista = new ArrayList<Setting>();
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "coal182");
           String sql="SELECT * FROM settings";
            ResultSet rs = bd.Select(sql);
        try {
        
            while (rs.next() ){
                int id = rs.getInt("idsetting");
                String name = rs.getString("name");
                String value = rs.getString("value");
                
                Setting set = new Setting(id, name, value);
                lista.add(set);
            
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingsMySQL.class.getName()).log(Level.SEVERE, null, ex);
        }                   
            bd.cerrarBaseDatos();

            return lista;
    }
    
}
