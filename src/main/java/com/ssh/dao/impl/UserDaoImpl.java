package com.ssh.dao.impl;

import com.ssh.dao.UserDao;
import com.ssh.model.UserModel;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-02-05 20:22
 */
@Repository("userDao")
public class UserDaoImpl implements UserDao {

    @Resource
    private HibernateTemplate hibernateTemplate;


    /**
     * QBC方式查询
     */
    public void test() {

        SessionFactory sessionFactory = hibernateTemplate.getSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        Criteria criteria = currentSession.createCriteria(UserModel.class);
        UserModel userModel = new UserModel();
        userModel.setAge(23).setUserName("john");

        Example example = Example.create(userModel);
        criteria.add(example);
        List list = criteria.list();

        list.forEach(one -> {
            UserModel user = (UserModel) one;
            System.err.println(user);
        });
    }

    @Override
    public Boolean addUser(UserModel userModel) {

        //返回的是它的记录数
        try {
            Serializable save = hibernateTemplate.save(userModel);
            System.err.println(save);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
