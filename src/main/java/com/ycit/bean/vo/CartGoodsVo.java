package com.ycit.bean.vo;

import com.ycit.bean.modal.Store;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * 购物车页面bean
 *
 * @author xlch
 * @Date 2018-04-04 21:18
 */
public class CartGoodsVo extends Store {

    private List<CartVo> cartVos;


    public static CartGoodsVo fromBean(Store store) {
        CartGoodsVo cartGoodsVo = new CartGoodsVo();
        BeanUtils.copyProperties(store, cartGoodsVo);
        return cartGoodsVo;
    }

    public List<CartVo> getCartVos() {
        return cartVos;
    }

    public void setCartVos(List<CartVo> cartVos) {
        this.cartVos = cartVos;
    }
}
