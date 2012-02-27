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
public interface ModuleInterface {
    
    public void newModule(Module m);
    public void editModule(Module m);
    public void deleteModule(Module m);
    public List<Module> getModules();
    public Module getModule(int id);
}
