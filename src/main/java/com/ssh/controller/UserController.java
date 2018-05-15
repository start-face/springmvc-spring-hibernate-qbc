package com.ssh.controller;

import com.ssh.model.News;
import com.ssh.model.UserModel;
import com.ssh.service.NewsService;
import com.ssh.service.UserService;
import com.ssh.tools.Str;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 用户操作类
 *
 * @author FaceFeel
 * @Created 2018-02-05 20:24
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;

    @RequestMapping("/updatePassWordPage")
    public String updatePassWordPage(HttpServletRequest request) {

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/loginPage";
        }

        request.setAttribute("user", currentUser);
        return "updatePassWordPage";
    }

    @RequestMapping("/updatePassWord")
    @ResponseBody
    public String updatePassWord(HttpServletRequest request, Long id, String passWord, String oldPassWord) {

        if (id == null || Str.isBlank(passWord) || Str.isBlank(oldPassWord)) {
            return "0";
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/loginPage";
        }

        List<UserModel> findResult = userService.showUser(new UserModel().setId(id).setPassWord(oldPassWord));
        if (findResult.size() > 0) {
            boolean result = userService.updatePassWord(id, passWord);
            if (result) {
                return "1";
            }
            return "0";
        }
        //旧密码输入错误
        return "2";
    }

    @RequestMapping("/getNewsList")
    public String getNewsList(HttpServletRequest request, News news) {

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        List<News> newsList = newsService.getNewsList(news);
        request.setAttribute("user", currentUser);
        request.setAttribute("newsList", newsList);
        return "index";
    }

    @RequestMapping("/pushNewsPage")
    public String pushNewsPage(HttpServletRequest request) {

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/loginPage";
        }

        request.setAttribute("user", currentUser);
        return "pushNews";
    }

    @RequestMapping("/userInfo")
    public String userInfo(HttpServletRequest request, Long id) {

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/loginPage";
        }

        UserModel userModel = userService.userInfo(id);
        request.setAttribute("user", userModel);
        return "userInfo";
    }

    /**
     * 跳转用户个人中心
     *
     * @param request http
     * @return "
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request, News news) {

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        news.setStatus(1);
        List<News> newsList = newsService.getNewsList(news);
        request.setAttribute("newsList", newsList);
        request.setAttribute("user", currentUser);
        return "index";
    }

    /**
     * 获取用户实体
     *
     * @param request http请求
     * @return jsp名称
     */
    @RequestMapping("/showUser")
    public String showUser(HttpServletRequest request) {

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/loginPage";
        }

        UserModel userModel = new UserModel();
        List<UserModel> userModels = userService.showUser(userModel);
        request.setAttribute("user", userModels);
        return "show";
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
        Boolean tom = userService.addUser(userModel);
        System.err.println(tom);
//        return "show";
    }
}
