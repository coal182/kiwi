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
public interface EntryInterface {
    
    public void newEntry(Entry e);
    public void editEntry(Entry e);
    public void deleteEntry(Entry e);
    public List<Entry> getEntries();
    public Entry getEntry(int id);
    
}
