package com.ssh.controller;

import com.ssh.model.News;
import com.ssh.model.UserModel;
import com.ssh.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-05-11 14:33
 **/
@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @RequestMapping("/addNews")
    public String addNews(HttpServletRequest request, News news){

        if (news == null){
            return "pushNews";
        }

        UserModel currentUser = (UserModel)request.getSession().getAttribute("currentUser");
        if (currentUser == null){
            return "redirect:/loginPage";
        }

        news.setAuthor(currentUser.getUserName())
                .setAuthorID(currentUser.getId())
                .setIsPopular(0)
                .setPushDate(new Date())
                .setStatus(1);
        boolean result = newsService.addNews(news);
        if (result){
            return "redirect:/user/index";
        }

        request.setAttribute("user",currentUser);
        return "pushNews";
    }

    @RequestMapping("/getNewsList")
    public String getNewsList(HttpServletRequest request,News news){

        if (news == null){
            return "newsManager";
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null){
            return "login";
        }

        news.setStatus(1).setAuthorID(currentUser.getId());
        List<News> newsList = newsService.getNewsList(news);
        request.setAttribute("news",newsList);
        request.setAttribute("user",currentUser);
        return "newsManager";
    }

    @RequestMapping("/deleteNews")
    public String deleteNews(HttpServletRequest request,Long id){

        if (id == null){
            return "login";
        }

        UserModel currentUser = (UserModel) request.getSession().getAttribute("currentUser");
        if (currentUser == null){
            return "redirect:/news/getNewsList";
        }

        boolean result = newsService.deleteNews(id);
        return "redirect:/news/getNewsList";
    }
}
