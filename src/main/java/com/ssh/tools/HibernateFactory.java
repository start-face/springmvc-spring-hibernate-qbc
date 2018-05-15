package com.ssh.tools;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Projections;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate4.HibernateTemplate;

/**
 * @author FaceFeel
 * @Created 2018-05-10 14:27
 **/
public class HibernateFactory {

    private static final Logger logger = LoggerFactory.getLogger(HibernateFactory.class);

    /**
     * 更新数据
     * @param hibernateTemplate hibernate模版
     * @param sql sql语句
     * @return "
     */
    public static boolean update(HibernateTemplate hibernateTemplate, String sql) {

        Session session = HibernateFactory.getSession(hibernateTemplate);
        try {
            Query query = session.createSQLQuery(sql);
            if (query.executeUpdate() > 0) {
                return true;
            }
            return false;
        } catch (Exception e) {
            logger.error("更新数据失败,失败的信息是:", e);
            return false;
        }
    }

    /**
     * 获取Criteria
     * @param hibernateTemplate hibernate模版
     * @param clazz 查询实体
     * @param t 查询条件
     * @param <T> 泛型
     * @return ""
     */
    public static <T> Criteria getCriteria(HibernateTemplate hibernateTemplate, Class<T> clazz, T t) {

        SessionFactory sessionFactory = hibernateTemplate.getSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        Criteria criteria = currentSession.createCriteria(clazz);
        Example example = Example.create(t);
        criteria.add(example);
        return criteria;
    }

    /**
     * 获取Criteria
     * @param criteria criteria
     * @param pageInfo 分页实体
     * @param session hibernate的session
     * @return ""
     */
    public static Criteria getPageCriteria(Criteria criteria, PageInfo pageInfo, Session session) {

        criteria.setProjection(null);
        criteria.setFirstResult(PageUtil.currentPage(pageInfo.getPageSize(), pageInfo.getCurrentPage()));
        criteria.setMaxResults(pageInfo.getPageSize());

        return criteria;
    }

    /**
     * 获取Criteria
     * @param clazz 查询实体
     * @param pageInfo 分页实体
     * @param session hibernate会话
     * @param <T> 泛型
     * @return ""
     */
    public static <T> Criteria getPageCriteria(Class<T> clazz, PageInfo pageInfo, Session session) {

        Criteria criteria = session.createCriteria(clazz);
        criteria.setProjection(Projections.rowCount());
        criteria.setProjection(null);
        criteria.setFirstResult(PageUtil.currentPage(pageInfo.getPageSize(), pageInfo.getCurrentPage()));
        criteria.setMaxResults(pageInfo.getPageSize());

        return criteria;
    }

    /**
     * 获取hibernate会话
     * @param hibernateTemplate hibernate模版
     * @return ""
     */
    public static Session getSession(HibernateTemplate hibernateTemplate) {

        SessionFactory sessionFactory = hibernateTemplate.getSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession;
    }
}
