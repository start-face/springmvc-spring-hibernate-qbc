package com.ssh.dao.impl;

import com.ssh.dao.UserDao;
import com.ssh.model.UserModel;
import com.ssh.tools.HibernateFactory;
import org.hibernate.Criteria;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户操作dao层接口实现类
 *
 * @author FaceFeel
 * @Created 2018-02-05 20:22
 */
@Repository("userDao")
public class UserDaoImpl implements UserDao {

    @Resource
    private HibernateTemplate hibernateTemplate;

    /**
     * 查询用户个人信息
     *
     * @param id 用户ID
     * @return ""
     */
    @Override
    public UserModel userInfo(Long id) {

        Criteria criteria = HibernateFactory.getCriteria(hibernateTemplate, UserModel.class, new UserModel().setId(id));
        List<UserModel> list = criteria.list();
        if (list.size() < 1) {
            return null;
        }

        return list.get(0);
    }

    /**
     * 登录方法
     *
     * @param userModel 用户实体
     * @return ""
     */
    @Override
    public UserModel login(UserModel userModel) {

        Criteria criteria = HibernateFactory.getCriteria(hibernateTemplate, UserModel.class, userModel);
        List<UserModel> list = criteria.list();
        if (list.size() < 1) {
            return null;
        }
        return list.get(0);
    }

    /**
     * QBC方式查询
     * 获取用户数据列表
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<UserModel> showUser(UserModel userModel) {
        return (List<UserModel>)HibernateFactory.getCriteria(hibernateTemplate, UserModel.class, userModel).list();
    }

    /**
     * 添加用户方法
     *
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
