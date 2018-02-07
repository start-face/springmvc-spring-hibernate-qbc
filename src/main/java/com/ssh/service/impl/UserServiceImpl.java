package com.ssh.service.impl;

import com.ssh.dao.UserDao;
import com.ssh.model.UserModel;
import com.ssh.service.UserService;
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

    @Autowired
    private UserDao userDao;

    /**
     * 获取用户列表
     * @return 布尔
     */
    @Override
    public List<UserModel> showUser() {

        return userDao.showUser();
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
            return false;
        }
    }
}
