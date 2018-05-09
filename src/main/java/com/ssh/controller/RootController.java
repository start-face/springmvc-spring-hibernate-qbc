package com.ssh.controller;

import com.ssh.model.UserModel;
import com.ssh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author FaceFeel
 * @Created 2018-04-30 21:05
 */

@Controller
@RequestMapping("/")
public class RootController {

    @Autowired
    private UserService userService;

    @RequestMapping("registerUser")
    @ResponseBody
    public String registerUser(HttpServletRequest request, UserModel userModel) {

        Boolean aBoolean = userService.addUser(userModel);
        if (aBoolean) {
            request.getSession().setAttribute("currentUser", userModel);
            return "1";
        }
        return "0";
    }

    @RequestMapping("register")
    public String register(HttpServletRequest request) {
        return "register";
    }
}
