package com.ssh.dao;

import com.ssh.model.News;

/**
 * @author FaceFeel
 * @Created 2018-05-11 14:38
 **/
public interface NewsDao {

    /**
     * 持久化信息
     * @param news 信息实体
     * @return ""
     */
    boolean addNews(News news);
}
