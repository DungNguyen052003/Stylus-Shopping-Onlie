/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author 84976
 */
public class Campain {
    private int campainID;
    private String name;
    private Date starDate;
    private Date endDate;
    private int discount;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    public Campain() {
    }

    public Campain(int campainID, String name, Date starDate, Date endDate, int discount) {
        this.campainID = campainID;
        this.name = name;
        this.starDate = starDate;
        this.endDate = endDate;
        this.discount = discount;
    }

    public int getCampainID() {
        return campainID;
    }

    public void setCampainID(int campainID) {
        this.campainID = campainID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStarDate() {
        return starDate;
    }

    public void setStarDate(Date starDate) {
        this.starDate = starDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    
    
}
