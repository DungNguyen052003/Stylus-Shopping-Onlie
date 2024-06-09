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
    private int CampainID;
    private String note;

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    public Slider(int id, String title, String image, int Status, int CampainID, String note) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.Status = Status;
        this.CampainID = CampainID;
        this.note = note;
    }

    public Slider() {
    }

    public int getCampainID() {
        return CampainID;
    }

    public void setCampainID(int CampainID) {
        this.CampainID = CampainID;
    }

    @Override
    public String toString() {
        return "Slider{" + "id=" + id + ", title=" + title + ", image=" + image + ", Status=" + Status + ", CampainID=" + CampainID + ", note=" + note + '}';
    }
    
    
}
