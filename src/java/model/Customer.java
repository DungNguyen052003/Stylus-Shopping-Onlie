package model;

import java.security.Timestamp;
import java.time.LocalDateTime;

public class Customer {

    private int customerID;
    private String address;
    private String email;
    private String phone;
    private int roleID;
    private String password;
    private int gender;
    private String name;  
    private String image;
    private int verifiedStatus;
    private LocalDateTime createdDate;
    
    
    public int getVerifiedStatus() {
        return verifiedStatus;
    }

    public void setVerifiedStatus(int verifiedStatus) {
        this.verifiedStatus = verifiedStatus;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }
    

    public Customer() {
    }

    public Customer(int customerID, String address, String email, int gender, String phone, int roleID, String password, String name, String image) {
        this.customerID = customerID;
        this.address = address;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.roleID = roleID;
        this.password = password;
        this.name = name;
        this.image = image;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerID=" + customerID + ", username=" + ", address=" + address + ", email=" + email + ", phone=" + phone + ", roleID=" + roleID + ", password=" + password + ", name=" + name + ", image=" + image + '}';
    }

}
