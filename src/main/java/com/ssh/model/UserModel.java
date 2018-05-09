package com.ssh.model;

import com.google.common.base.MoreObjects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体
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
    private String passWord;
    private String mail;
    private String phone;
    private int sex;
    private String headImage;
    private String address;
    private Integer age;
    private Date birthday;

    public UserModel(){}

    @Override
    public String toString() {
        return MoreObjects.toStringHelper(this)
                .add("id", id)
                .add("userName", userName)
                .add("passWord", passWord)
                .add("mail", mail)
                .add("phone", phone)
                .add("sex", sex)
                .add("headImage", headImage)
                .add("address", address)
                .add("age", age)
                .add("birthday", birthday)
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

    public String getPassWord() {
        return passWord;
    }

    public UserModel setPassWord(String passWord) {
        this.passWord = passWord;
        return this;
    }

    public String getMail() {
        return mail;
    }

    public UserModel setMail(String mail) {
        this.mail = mail;
        return this;
    }

    public String getPhone() {
        return phone;
    }

    public UserModel setPhone(String phone) {
        this.phone = phone;
        return this;
    }

    public int getSex() {
        return sex;
    }

    public UserModel setSex(int sex) {
        this.sex = sex;
        return this;
    }

    public String getHeadImage() {
        return headImage;
    }

    public UserModel setHeadImage(String headImage) {
        this.headImage = headImage;
        return this;
    }

    public String getAddress() {
        return address;
    }

    public UserModel setAddress(String address) {
        this.address = address;
        return this;
    }

    public Integer getAge() {
        return age;
    }

    public UserModel setAge(Integer age) {
        this.age = age;
        return this;
    }

    public Date getBirthday() {
        return birthday;
    }

    public UserModel setBirthday(Date birthday) {
        this.birthday = birthday;
        return this;
    }
}
