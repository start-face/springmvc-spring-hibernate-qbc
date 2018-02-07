package com.ssh.service;

import com.ssh.model.UserModel;

import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-02-04 23:01
 */
public interface UserService {

    List<UserModel> showUser();

    Boolean addUser(UserModel userModel);
}
