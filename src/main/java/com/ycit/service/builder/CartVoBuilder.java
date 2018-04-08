package com.ycit.service.builder;

import com.ycit.bean.modal.Cart;
import com.ycit.bean.modal.Goods;
import com.ycit.bean.modal.Store;
import com.ycit.bean.vo.CartGoodsVo;
import com.ycit.bean.vo.CartVo;
import com.ycit.service.CartService;
import com.ycit.service.GoodsService;
import com.ycit.service.StoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * CartVo 构建器
 *
 * @author xlch
 * @Date 2018-04-04 16:56
 */
@Service
public class CartVoBuilder {

    private GoodsService goodsService;

    private StoreService storeService;

    private CartService cartService;

    @Resource
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    @Resource
    public void setStoreService(StoreService storeService) {
        this.storeService = storeService;
    }

    @Resource
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public CartGoodsVo buildOne(int storeId) {
        Store store = storeService.findById(storeId);
        CartGoodsVo cartGoodsVo = CartGoodsVo.fromBean(store);
        List<Cart> carts = cartService.findByStore(store.getId());
        List<CartVo> cartVos = this.buildCartVos(carts);
        cartGoodsVo.setCartVos(cartVos);
        return cartGoodsVo;
    }

    public List<CartGoodsVo> buildList(List<Integer> ids) {
        List<CartGoodsVo> cartGoodsVos = new ArrayList<>();
        ids.forEach(id -> {
            CartGoodsVo cartGoodsVo = this.buildOne(id);
            cartGoodsVos.add(cartGoodsVo);
        });
        return cartGoodsVos;
    }

    public CartVo buildCartVo(Cart cart) {
        CartVo cartVo = CartVo.fromBean(cart);
        Goods goods = goodsService.findById(cart.getGoodsId());
        cartVo.setGoods(goods);
        return cartVo;
    }

    public List<CartVo> buildCartVos(List<Cart> carts) {
        List<CartVo> cartVos = new ArrayList<>();
        carts.forEach(cart -> {
            CartVo cartVo = this.buildCartVo(cart);
            cartVos.add(cartVo);
        });
        return cartVos;
    }

}
