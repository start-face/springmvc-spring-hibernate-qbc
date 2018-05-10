package com.ssh.tools;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
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
}
