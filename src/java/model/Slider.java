/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TienP
 */
public class Slider {
    private int id;
    private String title;
    private String image;
    private int Status;
    private Category CategoryId;
    private String note;
    private String backlink;

    public Slider() {
    }

    public Slider(int id, String title, String image, int Status, Category CategoryId, String note, String backlink) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.Status = Status;
        this.CategoryId = CategoryId;
        this.note = note;
        this.backlink = backlink;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public Category getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(Category CategoryId) {
        this.CategoryId = CategoryId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getBacklink() {
        return backlink;
    }

    public void setBacklink(String backlink) {
        this.backlink = backlink;
    }

   
    
}
