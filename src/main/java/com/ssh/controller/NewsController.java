package com.ssh.controller;

import com.ssh.model.News;
import com.ssh.service.NewsService;
import com.ssh.model.UserModel;
import com.ssh.tools.Page;
import com.ssh.tools.PageInfo;
import com.ssh.tools.ToolJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;

/**
 * @author FaceFeel
 * @Created 2018-05-11 14:33
 **/
@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @RequestMapping("/revert")
    @ResponseBody
    public String revertNews(HttpServletRequest request, Long id) {

        if (id == null) {
            return "0";
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/loginPage";
        }

        boolean result = newsService.revertNews(id);
        if (result){
            return "1";
        }
        return "0";
    }

    @RequestMapping("/addNews")
    @ResponseBody
    public String addNews(HttpServletRequest request, News news) {

        if (news == null) {
            return "0";
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/loginPage";
        }

        news.setAuthor(currentUser.getUserName())
                .setAuthorID(currentUser.getId())
                .setIsPopular(0)
                .setPushDate(new Date())
                .setStatus(1);
        boolean result = newsService.addNews(news);
        if (result) {
            return "1";
        }
        request.setAttribute("user", currentUser);
        return "0";
    }

    @RequestMapping("/getNewsList")
    public String getNewsList(HttpServletRequest request, News news) {

        if (news == null) {
            return "newsManager";
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "login";
        }
        request.setAttribute("user", currentUser);
        return "newsManager";
    }

    @RequestMapping("/getNews")
    @ResponseBody
    public String getNews(HttpServletRequest request, News news, PageInfo pageInfo) {

        if (news == null || pageInfo == null) {
            Page<News> page = new Page<>(0, 0, 0L, 0, new ArrayList<>());
            return ToolJson.anyToJson(page);
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            Page<News> page = new Page<>(0, 0, 0L, 0, new ArrayList<>());
            return ToolJson.anyToJson(page);
        }

        news.setStatus(1).setAuthorID(currentUser.getId());
        Page<News> newsList = newsService.getNewsList(news, pageInfo);
        return ToolJson.anyToJson(newsList);
    }

    @RequestMapping("/getDeletedNewsList")
    public String getDeletedNewsList(HttpServletRequest request, News news) {

        if (news == null) {
            return "deletedNewsManager";
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "login";
        }
        request.setAttribute("user", currentUser);
        return "deletedNewsManager";
    }

    @RequestMapping("/getDeletedNews")
    @ResponseBody
    public String getDeletedNews(HttpServletRequest request, News news, PageInfo pageInfo) {

        if (news == null || pageInfo == null) {
            Page<News> page = new Page<>(0, 0, 0L, 0, new ArrayList<>());
            return ToolJson.anyToJson(page);
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            Page<News> page = new Page<>(0, 0, 0L, 0, new ArrayList<>());
            return ToolJson.anyToJson(page);
        }

        news.setStatus(0).setAuthorID(currentUser.getId());
        Page<News> newsList = newsService.getNewsList(news, pageInfo);
        return ToolJson.anyToJson(newsList);
    }

    @RequestMapping("/deleteNews")
    @ResponseBody
    public String deleteNews(HttpServletRequest request, Long id) {

        if (id == null) {
            return "0";
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/loginPage";
        }
        boolean result = newsService.deleteNews(id);
        if (result) {
            return "1";
        }
        return "0";
    }
}
