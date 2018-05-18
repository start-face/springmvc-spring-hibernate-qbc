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
     * 更新头像
     * @param id 用户ID
     * @param headImage 用户上传头像保存路径
     * @return "
     */
    boolean updateImage(Long id,String headImage);

    /**
     * 修改用户密码
     * @param id 用户ID
     * @param passWord 密码
     * @return ""
     */
    boolean updatePassWord(Long id,String passWord);

    /**
     * 查询用户个人信息
     * @param id 用户ID
     * @return ""
     */
    UserModel userInfo(Long id);

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
