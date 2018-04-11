package com.ycit.service;

import com.ycit.bean.criteria.GoodsSearchForm;
import com.ycit.bean.modal.Goods;
import com.ycit.mapper.GoodsMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品 业务层
 *
 * @author xlch
 * @Date 2018-03-30 10:58
 */
@Service
public class GoodsService {

    private GoodsMapper goodsMapper;

    @Resource
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    public List<Goods> findTopN(int n) {
        return goodsMapper.topN(n);
    }

    public List<Goods> finds(GoodsSearchForm searchForm) {
        return goodsMapper.finds(searchForm);
    }

    public List<Goods> hot(int n) {
        return goodsMapper.hot(n);
    }

    public Goods findById(int id) {
        return goodsMapper.findById(id);
    }

    public int updateStockAndSaleCountById(int id, int buyNum) {
        return goodsMapper.updateStockAndSaleCountById(id, buyNum);
    }

}
