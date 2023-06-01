package com.example.ss11_jdbc.model;

public class User {
    protected int id;
    protected String user_name;
    protected String email;
    protected String country;
    public User() {}

    public User(String name, String email, String country) {
        super();
        this.user_name = user_name;
        this.email = email;
        this.country = country;
    }

    public User(int id, String user_name, String email, String country) {
        super();
        this.id = id;
        this.user_name = user_name;
        this.email = email;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return user_name;
    }

    public void setName(String user_name) {
        this.user_name = user_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
