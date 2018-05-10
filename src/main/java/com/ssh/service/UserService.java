package com.ssh.service;

import com.ssh.model.UserModel;

import java.util.List;

/**
 * 用户操作service层接口
 * @author FaceFeel
 * @Created 2018-02-04 23:01
 */
public interface UserService {

    /**
     * 登录方法
     * @param userModel 用户实体
     * @return ""
     */
    UserModel login(UserModel userModel);

    /**
     * 获取用户列表方法
     * @return 用户实体集合
     */
    List<UserModel> showUser(UserModel userModel);

    /**
     * 添加用户方法
     * @param userModel 用户实体
     * @return 布尔
     */
    Boolean addUser(UserModel userModel);
}
