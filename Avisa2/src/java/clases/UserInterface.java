/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.util.List;

/**
 *
 * @author aula1-15
 */
public interface UserInterface {
    
    public void newUser(User u);
    public void editUser(User u);
    public void deleteUser(User u);
    public List<User> getUsers();
    public List<User> getUsersFull();
    public User getUser(int id);
    public User getUser(String alias);
    
}
