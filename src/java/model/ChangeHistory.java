/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author ngock
 */
public class ChangeHistory {
    private int changeID;
    private int customerID;
    private String email;
    private String name;
    private String gender;
    private String phone;
    private String address;
    private String updatedBy;
    private LocalDateTime updatedDate;

    public ChangeHistory() {
    }

    public ChangeHistory(int changeID, int customerID, String email, String name, String gender, String phone, String address, String updatedBy, LocalDateTime updatedDate) {
        this.changeID = changeID;
        this.customerID = customerID;
        this.email = email;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.updatedBy = updatedBy;
        this.updatedDate = updatedDate;
    }

    public int getChangeID() {
        return changeID;
    }

    public void setChangeID(int changeID) {
        this.changeID = changeID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public LocalDateTime getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(LocalDateTime updatedDate) {
        this.updatedDate = updatedDate;
    }
    
    
}
