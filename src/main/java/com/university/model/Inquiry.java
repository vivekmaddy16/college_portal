package com.university.model;

import java.sql.Timestamp;

public class Inquiry {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String program;
    private String message;
    private Timestamp createdAt;

    public Inquiry() {
    }

    public Inquiry(String name, String email, String phone, String program, String message) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.program = program;
        this.message = message;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
