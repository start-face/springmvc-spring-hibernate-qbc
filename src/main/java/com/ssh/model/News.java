package com.ssh.model;

import com.google.common.base.MoreObjects;

import javax.persistence.*;
import java.util.Date;

/**
 * @author FaceFeel
 * @Created 2018-05-11 12:10
 **/
@Entity
@Table(name = "news_model")
public class News implements java.io.Serializable{

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
    private String title;
    private String newsType;
    private String newsAddress;
    private String content;
    private Date pushDate;
    private String author;
    private Long authorID;
    private Integer status;
    private Integer isPopular;
    private String images;

    public News() {
    }

    @Override
    public String toString() {
        return MoreObjects.toStringHelper(this)
                .add("id", id)
                .add("title", title)
                .add("newsType", newsType)
                .add("newsAddress", newsAddress)
                .add("content", content)
                .add("pushDate", pushDate)
                .add("author", author)
                .add("authorID", authorID)
                .add("status", status)
                .add("isPopular", isPopular)
                .add("images", images)
                .toString();
    }

    public Long getId() {
        return id;
    }

    public News setId(Long id) {
        this.id = id;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public News setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getNewsType() {
        return newsType;
    }

    public News setNewsType(String newsType) {
        this.newsType = newsType;
        return this;
    }

    public String getNewsAddress() {
        return newsAddress;
    }

    public News setNewsAddress(String newsAddress) {
        this.newsAddress = newsAddress;
        return this;
    }

    public String getContent() {
        return content;
    }

    public News setContent(String content) {
        this.content = content;
        return this;
    }

    public Date getPushDate() {
        return pushDate;
    }

    public News setPushDate(Date pushDate) {
        this.pushDate = pushDate;
        return this;
    }

    public String getAuthor() {
        return author;
    }

    public News setAuthor(String author) {
        this.author = author;
        return this;
    }

    public Long getAuthorID() {
        return authorID;
    }

    public News setAuthorID(Long authorID) {
        this.authorID = authorID;
        return this;
    }

    public Integer getStatus() {
        return status;
    }

    public News setStatus(Integer status) {
        this.status = status;
        return this;
    }

    public Integer getIsPopular() {
        return isPopular;
    }

    public News setIsPopular(Integer isPopular) {
        this.isPopular = isPopular;
        return this;
    }

    public String getImages() {
        return images;
    }

    public News setImages(String images) {
        this.images = images;
        return this;
    }
}
