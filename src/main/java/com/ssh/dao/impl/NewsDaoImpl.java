package com.ssh.dao.impl;

import com.ssh.dao.NewsDao;
import com.ssh.model.News;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;

/**
 * @author FaceFeel
 * @Created 2018-05-11 14:38
 **/
@Repository("newsDao")
public class NewsDaoImpl implements NewsDao {

    @Resource
    private HibernateTemplate hibernateTemplate;

    /**
     * 持久化信息
     * @param news 信息实体
     * @return ""
     */
    @Override
    public boolean addNews(News news) {

        String save = hibernateTemplate.save(news).toString();
        if (Integer.parseInt(save) > 0){
            return true;
        }
        return false;
    }
}
