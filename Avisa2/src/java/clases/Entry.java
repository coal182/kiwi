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
public class Entry {
    private int id;
    private String title;
    private String content;
    private User author;
    private Date created;

    public Entry() {
    }

    public Entry(int id, String title, String content, User author, Date created) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.created = created;
    }

    public Entry(String title, String content, User author, Date created) {
        this.title = title;
        this.content = content;
        this.author = author;
        this.created = created;
    }
    

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


}
