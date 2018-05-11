package com.ssh.controller;

import com.ssh.model.News;
import com.ssh.model.UserModel;
import com.ssh.service.NewsService;
import com.ssh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-04-30 21:05
 */

@Controller
@RequestMapping("/")
public class RootController {

    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;

    @RequestMapping("index")
    public String index(HttpServletRequest request) {

        List<News> newsList = newsService.getNewsList(new News());
        request.setAttribute("news", newsList);
        return "index";
    }

    /**
     * 登录
     *
     * @return "
     */
    @RequestMapping("login")
    @ResponseBody
    public String login(HttpServletRequest request, UserModel userModel) {

        UserModel login = userService.login(userModel);
        if (login == null) {
            return "0";
        }

        request.getSession().setAttribute("currentUser", login);
        return "1";
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request) {

        request.getSession().removeAttribute("currentUser");
        return "index";
    }

    /**
     * 跳转登录界面
     *
     * @return "
     */
    @RequestMapping("loginPage")
    public String loginPage() {
        return "login";
    }

    @RequestMapping("registerUser")
    @ResponseBody
    public String registerUser(HttpServletRequest request, UserModel userModel) {

        if (userModel == null) {
            return "0";
        }

        Boolean aBoolean = userService.addUser(userModel);
        if (aBoolean) {
            request.getSession().setAttribute("currentUser", userModel);
            return "1";
        }
        return "0";
    }

    @RequestMapping("register")
    public String register() {
        return "register";
    }
}
