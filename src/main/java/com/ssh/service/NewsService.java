package com.ssh.service;

import com.ssh.model.News;

/**
 * @author FaceFeel
 * @Created 2018-05-11 14:36
 **/
public interface NewsService {

    /**
     * 持久化信息
     * @param news 信息实体
     * @return ""
     */
    boolean addNews(News news);
}
