
package model;
public class Account {
    private int accountID;
    private String password;
    private int role;
    private int phone;
    private int gender;
    private String email;
    private String image;
    private String name;

    public Account() {
    }

    public Account(int accountID, String password, int role, int phone, int gender, String email, String image, String name) {
        this.accountID = accountID;
        this.gender = gender;
        this.password = password;
        this.role = role;
        this.phone = phone;
        this.email = email;
        this.image = image;
        this.name = name;
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

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
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

    @Override
    public String toString() {
        return "Account{" + "accountID=" + accountID + ", password=" + password + ", role=" + role + ", phone=" + phone + ", email=" + email + ", image=" + image + ", name=" + name + '}';
    }
    
}
