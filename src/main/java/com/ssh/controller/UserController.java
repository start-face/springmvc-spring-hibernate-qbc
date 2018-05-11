package com.ssh.controller;

import com.ssh.model.UserModel;
import com.ssh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/getNewsList")
    public String getNewsList(HttpServletRequest request){

        return "index";
    }

    @RequestMapping("/pushNewsPage")
    public String pushNewsPage(){
        return "pushNews";
    }

    @RequestMapping("/userInfo")
    public String userInfo(HttpServletRequest request,Long id){

        UserModel userModel = userService.userInfo(id);
        request.setAttribute("user",userModel);
        return "userInfo";
    }

    /**
     * 跳转用户个人中心
     * @param request http
     * @return "
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request){

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        request.setAttribute("user",currentUser);
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

        UserModel userModel = new UserModel();
        List<UserModel> userModels = userService.showUser(userModel);
        request.setAttribute("user", userModels);
        return "show";
    }

    /**
     * 添加用户方法
     *
     * @param request http请求
     * @return jsp名称
     */
    @RequestMapping("/addUser")
    public String show(HttpServletRequest request) {

        UserModel userModel = new UserModel();
        userModel.setAge(12)
                .setUserName("曹操")
                .setAddress("中国北京")
                .setBirthday(new Date())
                .setMail("123456@qq.com")
                .setPassWord("123456")
                .setPhone("12345678912")
                .setSex(1);
        Boolean tom = userService.addUser(userModel);
        System.err.println(tom);
        return "show";
    }
}
