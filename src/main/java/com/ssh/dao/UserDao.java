package com.ssh.dao;

import com.ssh.model.UserModel;

import java.util.List;

/**
 * 用户操作dao层接口
 * @author FaceFeel
 * @Created 2018-02-05 20:22
 */
public interface UserDao {

    /**
     * 获取用户数据列表
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
