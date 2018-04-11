package com.ycit.service;

import com.ycit.bean.modal.OrderGoods;
import com.ycit.mapper.OrderGoodsMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 订单对应商品 业务层
 *
 * @author xlch
 * @Date 2018-04-09 10:02
 */
@Service
public class OrderGoodsService {

    private OrderGoodsMapper orderGoodsMapper;

    @Resource
    public void setOrderGoodsMapper(OrderGoodsMapper orderGoodsMapper) {
        this.orderGoodsMapper = orderGoodsMapper;
    }

    public List<OrderGoods> insertBatch(List<OrderGoods> orderGoodsList) {
        orderGoodsMapper.insertBatch(orderGoodsList);
        return this.findByOrder(orderGoodsList.get(0).getOrderId());
    }

    public List<OrderGoods> findByOrder(int orderId) {
        return orderGoodsMapper.findByOrderId(orderId);
    }

    public OrderGoods findById(int id) {
        return orderGoodsMapper.findById(id);
    }

    public OrderGoods insert(OrderGoods orderGoods) {
        orderGoodsMapper.insert(orderGoods);
        return this.findById(orderGoods.getId());
    }

    public int deleteByOrderId(int orderId) {
        return orderGoodsMapper.deleteByOrderId(orderId);
    }

}
