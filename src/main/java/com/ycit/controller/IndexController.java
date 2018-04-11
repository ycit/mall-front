package com.ycit.controller;

import com.ycit.bean.modal.User;
import com.ycit.service.GoodsService;
import com.ycit.service.NewsService;
import com.ycit.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * 主页 控制层
 *
 * @author xlch
 * @Date 2018-03-21 15:44
 */
@Controller
@RequestMapping("/front")
public class IndexController {

    private UserService userService;

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    private NewsService newsService;

    @Resource
    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    private GoodsService goodsService;

    @Resource
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    /**
     * 用户首页
     * @param model
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String home( Model model) {
        model.addAttribute("newses", newsService.findTopN(5));
        model.addAttribute("goodses", goodsService.findTopN(5));
         Subject subject= SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            String username = subject.getPrincipal().toString();
            User user = userService.findByUsername(username);
            model.addAttribute("user", user);
        }
        return "/index";
    }

}
