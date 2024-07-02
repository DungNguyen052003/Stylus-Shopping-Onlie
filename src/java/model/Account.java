
package model;
public class Account {
    private int accountID;
    private String password;
    private Role role;
    private int phone;
    private int gender;
    private String email;
    private String image;
    private String name;
    private int status;
    private String address;
    private int totalOrder;
    public Account() {
    }

    public Account(int accountID, String password, Role role, int phone, int gender, String email, String image, String name, int status) {
        this.accountID = accountID;
        this.password = password;
        this.role = role;
        this.phone = phone;
        this.gender = gender;
        this.email = email;
        this.image = image;
        this.name = name;
        this.status = status;
    }
    public Account(int accountID, Role role, int phone, int gender, String email, String image, String name, int status) {
        this.accountID = accountID;
       
        this.role = role;
        this.phone = phone;
        this.gender = gender;
        this.email = email;
        this.image = image;
        this.name = name;
        this.status = status;
    }

    public int getTotalOrder() {
        return totalOrder;
    }

    public void setTotalOrder(int totalOrder) {
        this.totalOrder = totalOrder;
    }


    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    

    

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }



    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

   

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" + "accountID=" + accountID + ", password=" + password + ", role=" + role + ", phone=" + phone + ", email=" + email + ", image=" + image + ", name=" + name + '}';
    }
    
}
