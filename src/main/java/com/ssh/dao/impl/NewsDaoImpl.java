package com.ssh.dao.impl;

import com.ssh.dao.NewsDao;
import com.ssh.model.News;
import com.ssh.tools.HibernateFactory;
import com.ssh.tools.Page;
import com.ssh.tools.PageInfo;
import com.ssh.tools.PageUtil;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-05-11 14:38
 **/
@Repository("newsDao")
public class NewsDaoImpl implements NewsDao {

    private static final Logger logger = LoggerFactory.getLogger(NewsDaoImpl.class);
    @Resource
    private HibernateTemplate hibernateTemplate;

    /**
     * 恢复删除的信息
     *
     * @param id 信息ID
     * @return ""
     */
    @Override
    public boolean revertNews(Long id) {
        String sql = "update news_model n set n.status=1 where n.id=" + id;
        return HibernateFactory.update(hibernateTemplate, sql);
    }

    /**
     * 删除信息
     *
     * @param id 信息ID
     * @return ""
     */
    @Override
    public boolean deleteNews(Long id) {

        String sql = "update news_model n set n.status=0 where n.id=" + id;
        return HibernateFactory.update(hibernateTemplate, sql);
    }

    /**
     * 获取所有新闻列表
     *
     * @param news 新闻实体
     * @return ""
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<News> getNewsList(News news) {

        Criteria criteria = HibernateFactory.getCriteria(hibernateTemplate, News.class, news);
        return (List<News>) criteria.list();
    }

    /**
     * 获取所有新闻列表
     *
     * @param news 新闻实体
     * @return ""
     */
    @Override
    @SuppressWarnings("unchecked")
    public Page<News> getNewsList(News news, PageInfo pageInfo) {

        try {
            return PageUtil.getPage(news, "pushDate", hibernateTemplate, pageInfo);
        } catch (HibernateException ex) {
            logger.error("分页查询出错,错误信息是:", ex);
            return null;
        }
    }

    /**
     * 持久化信息
     *
     * @param news 信息实体
     * @return ""
     */
    @Override
    public boolean addNews(News news) {

        String save = hibernateTemplate.save(news).toString();
        if (Integer.parseInt(save) > 0) {
            return true;
        }
        return false;
    }
}
