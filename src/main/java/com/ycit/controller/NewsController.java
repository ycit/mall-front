package com.ycit.controller;

import com.ycit.bean.modal.News;
import com.ycit.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * 资讯控制层
 *
 * @author xlch
 * @Date 2018-03-30 10:10
 */
@Controller
@RequestMapping("/front")
public class NewsController {

    private NewsService newsService;

    @Resource
    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    @RequestMapping("/newses/newest")
    public List<News> topN(@RequestParam(value = "n", required = false, defaultValue = "5")int n) {
        List<News> newsList = newsService.findTopN(n);
        return newsList;
    }

}
