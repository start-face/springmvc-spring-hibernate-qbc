package com.ssh.controller;

import com.ssh.model.News;
import com.ssh.service.NewsService;
import com.ssh.model.UserModel;
import com.ssh.service.UserService;
import com.ssh.tools.Str;
import com.ssh.tools.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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

    @RequestMapping("loadingPage")
    public String loadingPage(){
        return "loading";
    }

    @RequestMapping("loading")
    @ResponseBody
    public String loading(HttpServletRequest request) {

        Object loading = request.getSession().getAttribute("loading");
        String string = "";
        if (loading == null || loading == "0"){
            string = "1";
        }else {
            string = request.getSession().getAttribute("loading").toString();
        }
        return string;
    }

    @RequestMapping("index")
    public String index(HttpServletRequest request, News news) {

        List<UserModel> userModels = userService.showUser(new UserModel());
        if (userModels == null || userModels.size() < 1) {
            addUser();
        }

        news.setStatus(1);
        List<News> newsList = newsService.getNewsList(news);

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        request.setAttribute("newsList", newsList);
        request.setAttribute("user", currentUser);
        return "index";
    }

    private void addUser() {

        UserModel userModel = new UserModel();
        userModel.setAge(12)
                .setUserName("admin")
                .setAddress("中国北京")
                .setBirthday(new Date())
                .setMail("123456@qq.com")
                .setPassWord("123456")
                .setPhone("12345678912")
                .setSex(1);
        userService.addUser(userModel);
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
