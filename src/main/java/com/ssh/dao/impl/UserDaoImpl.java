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
 * 用户操作dao层接口实现类
 * @author FaceFeel
 * @Created 2018-02-05 20:22
 */
@Repository("userDao")
public class UserDaoImpl implements UserDao {

    @Resource
    private HibernateTemplate hibernateTemplate;

    /**
     * QBC方式查询
     * 获取用户数据列表
     */
    @Override
    public List<UserModel> showUser(UserModel userModel) {

        SessionFactory sessionFactory = hibernateTemplate.getSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        Criteria criteria = currentSession.createCriteria(UserModel.class);
        Example example = Example.create(userModel);
        criteria.add(example);
        List<UserModel> list = criteria.list();

        list.forEach(one -> {
            UserModel user = (UserModel) one;
            System.err.println(user);
        });
        return list;
    }

    /**
     * 添加用户方法
     * @param userModel 用户实体
     * @return 布尔
     */
    @Override
    public Boolean addUser(UserModel userModel) {

        try {
            //返回的是它的记录数
            hibernateTemplate.save(userModel);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
