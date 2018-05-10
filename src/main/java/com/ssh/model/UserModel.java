package com.ssh.model;

import com.google.common.base.MoreObjects;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体
 * @author FaceFeel
 * @Created 2018-02-05 20:15
 */
@Entity
@Table(name = "hb_user_model")
public class UserModel implements Serializable {

    /**
     * 如果使用的是String类型,则必须给定主键一个默认值,或是在插入的时候自己指定主键值,
     * 否则会报:Field 'id' doesn't have a default value
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
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

    public Long getId() {
        return id;
    }

    public UserModel setId(Long id) {
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
