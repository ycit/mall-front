package com.ycit.bean.vo;

import com.ycit.bean.modal.Cart;
import com.ycit.bean.modal.Goods;
import org.springframework.beans.BeanUtils;

/**
 * 购物车页面显示 bean
 *
 * @author xlch
 * @Date 2018-04-04 16:55
 */
public class CartVo extends Cart {

    private int exist;
    private Goods goods;

    public static CartVo fromBean(Cart cart) {
        CartVo cartVo = new CartVo();
        BeanUtils.copyProperties(cart, cartVo);
        return cartVo;
    }

    public int getExist() {
        return exist;
    }

    public void setExist(int exist) {
        this.exist = exist;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }
}
