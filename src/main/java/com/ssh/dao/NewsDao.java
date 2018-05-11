package com.ssh.dao;

import com.ssh.model.News;

import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-05-11 14:38
 **/
public interface NewsDao {

    /**
     * 获取所有新闻列表
     * @param news 新闻实体
     * @return ""
     */
    List<News> getNewsList(News news);

    /**
     * 持久化信息
     * @param news 信息实体
     * @return ""
     */
    boolean addNews(News news);
}
