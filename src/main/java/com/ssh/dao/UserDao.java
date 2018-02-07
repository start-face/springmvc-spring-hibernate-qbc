package com.ssh.dao;

import com.ssh.model.UserModel;

import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-02-05 20:22
 */

public interface UserDao {

    List<UserModel> showUser();

    Boolean addUser(UserModel userModel);
}
