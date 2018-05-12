package com.ssh.dao.impl;

import com.ssh.dao.NewsDao;
import com.ssh.model.News;
import com.ssh.tools.HibernateFactory;
import com.ssh.tools.Page;
import com.ssh.tools.PageInfo;
import com.ssh.tools.PageUtil;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
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
     * 删除信息
     *
     * @param id 信息ID
     * @return ""
     */
    @Override
    public boolean deleteNews(Long id) {

        Session session = HibernateFactory.getSession(hibernateTemplate);
        try {
            session.update(new News().setId(id).setStatus(0));
            return true;
        } catch (Exception e) {
            return false;
        }
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

        Session session = HibernateFactory.getSession(hibernateTemplate);
        try {

            Criteria criteria = session.createCriteria(News.class);
            criteria.setProjection(Projections.rowCount());
            int totalCount = Integer.valueOf(criteria.uniqueResult().toString());
            criteria.setProjection(null);
            criteria.setFirstResult(PageUtil.currentPage(pageInfo.getPageSize(), pageInfo.getCurrentPage()));
            criteria.setMaxResults(pageInfo.getPageSize());
            Page<News> page = PageUtil.getPage(pageInfo,totalCount);
            page.setList((List<News>) criteria.list());
            return page;
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
