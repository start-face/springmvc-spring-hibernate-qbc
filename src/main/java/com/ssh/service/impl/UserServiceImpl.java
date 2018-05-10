package com.ssh.service.impl;

import com.ssh.dao.UserDao;
import com.ssh.model.UserModel;
import com.ssh.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户操作service层接口实现类
 * @author FaceFeel
 * @Created 2018-02-05 20:11
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserDao userDao;

    /**
     * 获取用户列表
     * @return 布尔
     */
    @Override
    public List<UserModel> showUser(UserModel userModel) {

        try {
            return userDao.showUser(userModel);
        }catch (Exception e){
            logger.error("获取用户列表失败,失败信息是:",e);
            return null;
        }
    }

    /**
     * 添加用户方法
     * @param userModel 用户实体
     * @return 布尔
     */
    @Override
    public Boolean addUser(UserModel userModel) {

        try {
            return userDao.addUser(userModel);
        }catch (Exception e){
            logger.error("添加用户失败,失败的信息是:",e);
            return false;
        }
    }
}
