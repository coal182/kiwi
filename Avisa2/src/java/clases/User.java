/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.util.Date;

/**
 *
 * @author aula1-15
 */
public class User {
    private int id;
    private String alias;
    private String password;
    private String name;
    private String usertype;
    private Date registered;

    public User() {
    }

    public User(int id, String alias, String name, String usertype) {
        this.id = id;
        this.alias = alias;
        this.name = name;
        this.usertype = usertype;
    }

    public User(String alias, String password, String name, String usertype) {
        this.alias = alias;
        this.password = password;
        this.name = name;
        this.usertype = usertype;
    }

    public User(int id, String alias, String password, String name, String usertype) {
        this.id = id;
        this.alias = alias;
        this.password = password;
        this.name = name;
        this.usertype = usertype;
    }
    

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegistered() {
        return registered;
    }

    public void setRegistered(Date registered) {
        this.registered = registered;
    }
    
    
}
