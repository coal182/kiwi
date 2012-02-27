/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author aula1-15
 */
public class Module {
    private int id;
    private String name;
    private String description;
    private String code;
    private String position;
    private int activity;
    private int order;

    public Module() {
    }

    public Module(String name, String description, String code, String position, int activity, int order) {
        this.name = name;
        this.description = description;
        this.code = code;
        this.position = position;
        this.activity = activity;
        this.order = order;
    }

    public Module(int id, String name, String description, String code, String position, int activity, int order) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.code = code;
        this.position = position;
        this.activity = activity;
        this.order = order;
    }

    public int getActivity() {
        return activity;
    }

    public void setActivity(int activity) {
        this.activity = activity;
    }

  

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
