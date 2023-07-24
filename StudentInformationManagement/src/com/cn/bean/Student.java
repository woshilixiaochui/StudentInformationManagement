package com.cn.bean;

public class Student {
    private int id;
    private String name;
    private int age;
    private String gender;
    private String hobby;
    private String email;

    public Student() {
    }

    public Student(int id, String name, int age, String gender, String hobby, String email) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.hobby = hobby;
        this.email = email;
    }

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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                ", hobby='" + hobby + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
