package com.ycit.bean.vo;

import com.ycit.bean.modal.Cart;
import com.ycit.bean.modal.Store;

import java.util.List;

/**
 * 购物车按店铺分组
 *
 * @author xlch
 * @Date 2018-04-06 16:27
 */
public class CartGroupVo extends Cart {

    private Store store;

    private List<CartGoodsVo> cartGoodsVos;

    public List<CartGoodsVo> getCartGoodsVos() {
        return cartGoodsVos;
    }

    public void setCartGoodsVos(List<CartGoodsVo> cartGoodsVos) {
        this.cartGoodsVos = cartGoodsVos;
    }
}
