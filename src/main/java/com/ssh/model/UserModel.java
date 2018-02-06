package com.ssh.model;

import com.google.common.base.MoreObjects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @author FaceFeel
 * @Created 2018-02-05 20:15
 */
@Entity
@Table(name = "userModel")
public class UserModel implements Serializable {

    @Id
    @GeneratedValue
    private String id;
    private String userName;
    private Integer age;

    public UserModel(){}

    public UserModel(String id, String userName, Integer age) {
        this.id = id;
        this.userName = userName;
        this.age = age;
    }

    @Override
    public String toString() {
        return MoreObjects.toStringHelper(this)
                .add("id", id)
                .add("userName", userName)
                .add("age", age)
                .toString();
    }

    public String getId() {
        return id;
    }

    public UserModel setId(String id) {
        this.id = id;
        return this;
    }

    public String getUserName() {
        return userName;
    }

    public UserModel setUserName(String userName) {
        this.userName = userName;
        return this;
    }

    public Integer getAge() {
        return age;
    }

    public UserModel setAge(Integer age) {
        this.age = age;
        return this;
    }
}
