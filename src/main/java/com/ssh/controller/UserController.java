package com.ssh.controller;

import com.ssh.model.UserModel;
import com.ssh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-02-05 20:24
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/showUser")
    public String showUser(HttpServletRequest request){

        List<UserModel> userModels = userService.showUser();
        System.err.println(userModels);
        return "show";
    }

    @RequestMapping("/addUser")
    public String show(HttpServletRequest request) {

//        Boolean tom = userService.addUser(new UserModel().setUserName("tom").setAge(12).setId("12"));
        Boolean tom = userService.addUser(new UserModel().setAge(12).setUserName("tom"));
        System.err.println(tom);
        return "show";
    }
}
