package com.ycit.service;

import com.ycit.bean.modal.News;
import com.ycit.mapper.NewsMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 资讯业务层
 *
 * @author xlch
 * @Date 2018-03-30 10:11
 */
@Service
public class NewsService {

    private NewsMapper newsMapper;

    @Resource
    public void setNewsMapper(NewsMapper newsMapper) {
        this.newsMapper = newsMapper;
    }

    /**
     * 最新资讯
     * @param n 前 n条
     * @return 最新资讯
     */
    public List<News> findTopN(int n) {
        return newsMapper.findTopN(n);
    }

}
