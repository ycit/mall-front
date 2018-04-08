package com.ycit.service;

import com.ycit.bean.modal.Cart;
import com.ycit.bean.vo.CartGoodsVo;
import com.ycit.bean.vo.CartVo;
import com.ycit.mapper.CartMapper;
import com.ycit.service.builder.CartVoBuilder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 购物车 业务层
 *
 * @author xlch
 * @Date 2018-04-04 15:25
 */
@Service
public class CartService {

    private CartMapper cartMapper;

    private CartVoBuilder cartVoBuilder;

    @Resource
    public void setCartVoBuilder(CartVoBuilder cartVoBuilder) {
        this.cartVoBuilder = cartVoBuilder;
    }

    @Resource
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    public Cart insert(Cart cart) {
        cartMapper.insert(cart);
        return cart;
    }

    public int findCount(int userId) {
        return cartMapper.findCount(userId);
    }

    public Cart findByGoodsAndUser(int goodsId, int userId) {
        return cartMapper.findByGoodsIdAndUser(goodsId, userId);
    }

    public int updateCount(int id, int count) {
        return cartMapper.updateCount(id, count);
    }

    public Cart findById(int id) {
        return cartMapper.findById(id);
    }

    /**
     * 向购物车添加商品 业务
     * @param cart
     * @return
     */
    public CartVo doAddGoods(Cart cart) {
        Cart cartDb = this.findByGoodsAndUser(cart.getGoodsId(), cart.getUserId());
        int id;
        int exist;
        if (cartDb == null) {
            this.insert(cart);
            id = cart.getId();
            exist = 0;
        } else {
            id = cartDb.getId();
            int total = cartDb.getGoodsCount() + cart.getGoodsCount();
            this.updateCount(id, total );
            exist = 1;
        }
        Cart cart1Db2 = this.findById(id);
        CartVo cartVo = CartVo.fromBean(cart1Db2);
        cartVo.setExist(exist);
        return cartVo;
    }

    public List<Cart> findByUser(int userId) {
        return cartMapper.findByUser(userId);
    }

    public List<Cart> findByStore(int storeId) {
        return cartMapper.findByStore(storeId);
    }

    public List<CartGoodsVo> findCarts(int userId) {
        List<Integer> stores = this.statStoreByUser(userId);
        return cartVoBuilder.buildList(stores);
    }

    public List<Integer> statStoreByUser(int userId) {
        return cartMapper.statStore(userId);
    }

    public int deleteById(int id) {
        return cartMapper.deleteById(id);
    }

    public int deleteBatch(String ids) {
        return cartMapper.deleteBatch(ids);
    }
}
