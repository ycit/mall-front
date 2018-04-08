package com.ycit.bean.modal;

import com.ycit.bean.base.Base;

/**
 * 购物车实体bean
 *
 * @author xlch
 * @Date 2018-04-04 15:14
 */
public class Cart extends Base{

    private int id;
    private int userId;
    private  int goodsId;
    private int goodsCount;
    private int storeId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(int goodsCount) {
        this.goodsCount = goodsCount;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }
}
