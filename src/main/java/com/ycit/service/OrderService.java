package com.ycit.service;

import com.ycit.bean.criteria.OrderSearchForm;
import com.ycit.bean.modal.Goods;
import com.ycit.bean.modal.Order;
import com.ycit.bean.modal.OrderGoods;
import com.ycit.bean.modal.User;
import com.ycit.bean.vo.OrderVo;
import com.ycit.mapper.OrderMapper;
import com.ycit.util.UUIDGenerator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 处理订单业务层
 *
 * @author xlch
 * @Date 2018-04-09 9:37
 */
@Service
public class OrderService {

    private OrderMapper orderMapper;

    private UserService userService;

    private OrderGoodsService orderGoodsService;

    private GoodsService goodsService;

    private CartService cartService;

    @Resource
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    @Resource
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @Resource
    public void setOrderGoodsService(OrderGoodsService orderGoodsService) {
        this.orderGoodsService = orderGoodsService;
    }

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Resource
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    public Order findById(int id) {
        return orderMapper.findById(id);
    }

    public Order insert(Order order) {
        orderMapper.insert(order);
        return this.findById(order.getId());
    }

    public List<Order> findByUser(int userId) {
        return orderMapper.findByUser(userId);
    }

    @Transactional
    public String doPay(OrderVo orderVo) {
        String  msg = "";
        int totalPrice = 0;
        Order order = Order.fromBean(orderVo);
        User user = userService.getCurrent();
        order.setUserId(user.getId());
        String code = UUIDGenerator.getUUID();
        order.setCode(code);
        Order orderDb = this.insert(order); // 插入订单表
        List<OrderGoods> orderGoodsList = orderVo.getGoodsList();
        List<OrderGoods> orderGoodsListDb = new ArrayList<>();
        for (OrderGoods orderGoods: orderGoodsList) {
            int goodsNum = orderGoods.getGoodsNum();
            int goodsId = orderGoods.getGoodsId();
            Goods goods = goodsService.findById(goodsId);
            int price = goods.getPrice();
            totalPrice += price * goodsNum;
            int stock = goods.getStock();
            if (goodsNum > stock) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                msg =  goods.getName() + "库存不足，购买失败";
                return msg;
            }
            orderGoods.setOrderCode(code);
            orderGoods.setOrderId(orderDb.getId());

            int num = goodsService.updateStockAndSaleCountById(goodsId, goodsNum);
            if (num < 1) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                msg = goods.getName() + "库存不足，购买失败";
                return msg;
            }
            OrderGoods orderGoodsDb = orderGoodsService.insert(orderGoods); //订单对应商品插入
            orderGoodsListDb.add(orderGoodsDb);
            cartService.deleteByUserAndGoods(user.getId(), goodsId); //删除购物车
        }
        if (totalPrice > user.getBalance()) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            msg = "余额不足， 购买失败";
            return msg;
        }
        int size = userService.updateBalanceById(user.getId(), totalPrice);
        if (size < 1) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            msg = "余额不足， 购买失败";
            return msg;
        }
        OrderVo orderVo1 = OrderVo.fromBean(orderDb);
        orderVo1.setGoodsList(orderGoodsListDb);
        return msg;
    }

    public List<Order> finds(OrderSearchForm searchForm) {
        User user = userService.getCurrent();
        searchForm.setUsername(user.getUsername());
        return orderMapper.finds(searchForm);
    }

    public int updateStatusById(int id, int status) {
        return  orderMapper.updateStatusById(id, status);
    }

    public int deleteById(int id) {
        return orderMapper.deleteById(id);
    }

    @Transactional
    public int doDeleteOrder(int id) {
        int num = this.deleteById(id);
        orderGoodsService.deleteByOrderId(id);
        return num;
    }


}
