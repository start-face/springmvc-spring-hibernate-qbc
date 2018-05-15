package com.ssh.service.impl;

import com.ssh.dao.UserDao;
import com.ssh.model.UserModel;
import com.ssh.service.UserService;
import com.ssh.tools.Str;
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
     * 修改用户密码
     * @param id 用户ID
     * @param passWord 密码
     * @return ""
     */
    @Override
    public boolean updatePassWord(Long id,String passWord) {

        if (id == null || Str.isBlank(passWord)){
            return false;
        }

        try {
            return userDao.updatePassWord(id,passWord);
        }catch (Exception e){
            logger.error("更新密码失败,失败的信息是:",e);
            return false;
        }
    }

    /**
     * 查询用户个人信息
     * @param id 用户ID
     * @return ""
     */
    @Override
    public UserModel userInfo(Long id) {

        if (id == null){
            return null;
        }

        try {
            return userDao.userInfo(id);
        }catch (Exception e){
            logger.error("查询用户信息失败,失败的信息是:",e);
            return null;
        }
    }

    @Override
    public UserModel login(UserModel userModel) {

        if (userModel == null){
            return null;
        }

        try {
            return userDao.login(userModel);
        }catch (Exception e){
            logger.error("获取用户列表失败,失败信息是:",e);
            return null;
        }
    }

    /**
     * 获取用户列表
     * @return 布尔
     */
    @Override
    public List<UserModel> showUser(UserModel userModel) {

        if (userModel == null){
            return null;
        }

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

        if (userModel == null){
            return false;
        }

        try {
            return userDao.addUser(userModel);
        }catch (Exception e){
            logger.error("添加用户失败,失败的信息是:",e);
            return false;
        }
    }
}
