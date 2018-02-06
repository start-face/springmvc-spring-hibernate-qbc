package com.ssh.service.impl;

import com.ssh.dao.UserDao;
import com.ssh.model.UserModel;
import com.ssh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author FaceFeel
 * @Created 2018-02-05 20:11
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public Boolean addUser(UserModel userModel) {

        try {
            return userDao.addUser(userModel);
        }catch (Exception e){
            return false;
        }
    }
}
