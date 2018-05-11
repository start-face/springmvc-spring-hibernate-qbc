package com.ssh.dao.impl;

import com.ssh.dao.NewsDao;
import com.ssh.model.News;
import com.ssh.tools.HibernateFactory;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-05-11 14:38
 **/
@Repository("newsDao")
public class NewsDaoImpl implements NewsDao {

    @Resource
    private HibernateTemplate hibernateTemplate;

    /**
     * 删除信息
     * @param id 信息ID
     * @return ""
     */
    @Override
    public boolean deleteNews(Long id) {

        Session session = HibernateFactory.getSession(hibernateTemplate);
        try {
            session.update(new News().setId(id).setStatus(0));
            return true;
        }catch (Exception e){
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
    public List<News> getNewsList(News news) {

        Criteria criteria = HibernateFactory.getCriteria(hibernateTemplate, News.class, news);
        List<News> list = criteria.list();
        return list;
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
