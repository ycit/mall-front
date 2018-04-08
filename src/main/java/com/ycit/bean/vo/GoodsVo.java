package com.ycit.bean.vo;

import com.ycit.bean.modal.DictInfo;
import com.ycit.bean.modal.Goods;
import com.ycit.bean.modal.Store;
import org.springframework.beans.BeanUtils;

/**
 * 商品页面传参
 *
 * @author xlch
 * @Date 2018-04-02 10:22
 */
public class GoodsVo extends Goods {


    private Store store;
    private DictInfo brand;
    private DictInfo category; // 电池种类
    private DictInfo purpose; // 电池用途


    public static GoodsVo fromBean(Goods goods) {
        GoodsVo goodsVo = new GoodsVo();
        BeanUtils.copyProperties(goods, goodsVo);
        return goodsVo;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public DictInfo getBrand() {
        return brand;
    }

    public void setBrand(DictInfo brand) {
        this.brand = brand;
    }

    public DictInfo getCategory() {
        return category;
    }

    public void setCategory(DictInfo category) {
        this.category = category;
    }

    public DictInfo getPurpose() {
        return purpose;
    }

    public void setPurpose(DictInfo purpose) {
        this.purpose = purpose;
    }
}
