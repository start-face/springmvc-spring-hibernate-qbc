package com.ssh.dao;

import com.ssh.model.News;
import com.ssh.tools.Page;
import com.ssh.tools.PageInfo;

import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-05-11 14:38
 **/
public interface NewsDao {

    /**
     * 恢复删除的信息
     * @param id 信息ID
     * @return ""
     */
    boolean revertNews(Long id);

    /**
     * 删除信息
     * @param id 信息ID
     * @return ""
     */
    boolean deleteNews(Long id);

    /**
     * 获取所有新闻列表
     * @param news 新闻实体
     * @return ""
     */
    List<News> getNewsList(News news);

    /**
     * 获取所有新闻列表
     * @param news 新闻实体
     * @return ""
     */
    Page<News> getNewsList(News news, PageInfo pageInfo);

    /**
     * 持久化信息
     * @param news 信息实体
     * @return ""
     */
    boolean addNews(News news);
}
