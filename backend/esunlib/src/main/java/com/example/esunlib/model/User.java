package com.example.esunlib.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class User {
    @Id
    private String userID;

    private String phoneNumber;
    private String password;

    private String userName;

    public String getPhoneNumber(){return phoneNumber;}
    public void setPhoneNumber(String phoneNumber){
        this.phoneNumber=phoneNumber;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName(){return userName;}
    public void setUserName(String userName){
        this.userName=userName;
    }
}
