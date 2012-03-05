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
 * @author aula1-15
 */
public class EntriesMySQLi implements EntryInterface{
    UserInterface manage = new UsersMySQLi();
    @Override
    public void newEntry(Entry e) {
        String content=e.getContent();
        content = content.replace("'", "''");
        e.setContent(content);
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
        String sql="INSERT INTO entry (title, content, created, iduser) VALUES "+
                "('"+e.getTitle()+"',"+
                "'"+e.getContent()+"', "+
                "'"+e.getCreated()+"', "+
                "'"+e.getAuthor().getId()+
                "')";
                System.out.println(sql);
                
        bd.Ejecuta(sql);
        bd.cerrarBaseDatos();
    }

    @Override
    public void editEntry(Entry e) {
        String content=e.getContent();
        content = content.replace("'", "''");
        e.setContent(content);
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
        String sql;
        int id=e.getId();  
        
        sql = "UPDATE entry SET identry="+
                e.getId()+", "+"title="+"'"+e.getTitle()+"'"+", "+
                "content="+"'"+e.getContent()+"'"+", "+
                "created="+"'"+e.getCreated()+"'"+", "+
                "iduser="+"'"+e.getAuthor().getId()+"'"+

                " WHERE identry="+id+" ";          
 
                
            System.out.println(sql);            
            bd.Ejecuta(sql);
            bd.cerrarBaseDatos();
    }

    @Override
    public void deleteEntry(Entry e) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
        String sql;  
        
        sql = "DELETE FROM entry WHERE identry="+e.getId();          
            
            System.out.println(sql);            
            bd.Ejecuta(sql);
            bd.cerrarBaseDatos();
    }

    @Override
    public List<Entry> getEntries() {
        List<Entry> lista = new ArrayList<Entry>();
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
           String sql="SELECT * FROM entry ORDER BY created DESC";
            ResultSet rs = bd.Select(sql);
        try {
        
            while (rs.next() ){
                int id = rs.getInt("identry");
                String title = rs.getString("title");
                String content = rs.getString("content");
                Date created = rs.getDate("created");
                int iduser = rs.getInt("iduser");
                                   
                User user = manage.getUser(iduser);

                Entry ent = new Entry(id,title,content,user,created);
                lista.add(ent);
            
            }
        } catch (SQLException ex) {
            Logger.getLogger(EntriesMySQLi.class.getName()).log(Level.SEVERE, null, ex);
        }                   
            bd.cerrarBaseDatos();

            return lista;
    }

    

    @Override
    public Entry getEntry(int id) {
        BaseDatos bd = new BaseDatos(BaseDatos.MySQL, "localhost", "avisa2", "root", "aula1-15");
        Entry ent = null;
        try {
            
               String sql="SELECT * FROM entry WHERE identry="+id;
                ResultSet rs = bd.Select(sql);
                if(rs.next()){
                id = rs.getInt("identry");
                String title = rs.getString("title");
                String content = rs.getString("content");
                Date created = rs.getDate("created");
                int iduser = rs.getInt("iduser");
                User user = manage.getUser(iduser);
                
                ent = new Entry(id,title,content,user,created);
                }             
                
        } catch (SQLException ex) {
            Logger.getLogger(EntriesMySQLi.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("ERROR en EntriesMySQLi");
            
        }finally{
            bd.cerrarBaseDatos();
        }
        return ent;
    }
    
}
