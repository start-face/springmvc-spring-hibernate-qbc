package com.ssh.tools;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate4.HibernateTemplate;

/**
 * @author FaceFeel
 * @Created 2018-05-10 14:27
 **/
public class HibernateFactory {

    public static <T> Criteria getCriteria(HibernateTemplate hibernateTemplate, Class<T> clazz, T t) {

        SessionFactory sessionFactory = hibernateTemplate.getSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        Criteria criteria = currentSession.createCriteria(clazz);
        Example example = Example.create(t);
        criteria.add(example);
        return criteria;
    }

    public static Criteria getPageCriteria(Criteria criteria,PageInfo pageInfo,Session session){

        criteria.setProjection(null);
        criteria.setFirstResult(PageUtil.currentPage(pageInfo.getPageSize(), pageInfo.getCurrentPage()));
        criteria.setMaxResults(pageInfo.getPageSize());

        return criteria;
    }

    public static <T> Criteria getPageCriteria(Class<T> clazz,PageInfo pageInfo,Session session){

        Criteria criteria = session.createCriteria(clazz);
        criteria.setProjection(Projections.rowCount());
        criteria.setProjection(null);
        criteria.setFirstResult(PageUtil.currentPage(pageInfo.getPageSize(), pageInfo.getCurrentPage()));
        criteria.setMaxResults(pageInfo.getPageSize());

        return criteria;
    }

    public static Session getSession(HibernateTemplate hibernateTemplate) {

        SessionFactory sessionFactory = hibernateTemplate.getSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession;
    }
}
