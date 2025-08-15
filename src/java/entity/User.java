/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class User {
    public int User_ID;
    public String User_Name;
    public String Email;
    public String Password;
    public String Address;
    public String Phone;
    public String Role;
    
    
    public User() {
    }

    public User(int User_ID, String User_Name, String Address, String Phone) {
        this.User_ID = User_ID;
        this.User_Name = User_Name;
        this.Address = Address;
        this.Phone = Phone;
    }

    public User(String Email) {
        this.Email = Email;
    }

    public User(String Email, String Password) {
        this.Email = Email;
        this.Password = Password;
    }

    public User(String User_Name, String Email, String Password, String Role) {
        this.User_Name = User_Name;
        this.Email = Email;
        this.Password = Password;
        this.Role = Role;
    }
 
    public User(int User_ID, String User_Name, String Email, String Password, String Address, String Phone, String Role) {
        this.User_ID = User_ID;
        this.User_Name = User_Name;
        this.Email = Email;
        this.Password = Password;
        this.Address = Address;
        this.Phone = Phone;
        this.Role = Role;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int User_ID) {
        this.User_ID = User_ID;
    }

    public String getUser_Name() {
        return User_Name;
    }

    public void setUser_Name(String User_Name) {
        this.User_Name = User_Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

    @Override
    public String toString() {
        return "User{" + "User_ID=" + User_ID + ", User_Name=" + User_Name + ", Email=" + Email + ", Password=" + Password + ", Address=" + Address + ", Phone=" + Phone + ", Role=" + Role + '}';
    }
    
    
}
