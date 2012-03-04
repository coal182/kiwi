/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.util.List;

/**
 *
 * @author usuario
 */
public interface SettingInterface {

    public void editSetting(Setting s);
    public Setting getSetting(String name);
    public List<Setting> getSettings();
    
}
