package com.ycit.bean.modal;

/**
 * 专卖店经营品牌类
 *
 * @author xlch
 * @Date 2018-03-30 14:10
 */
public class StoreBrand {

    private int id;
    private int storeId;
    private int brandId;
    private String brandName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
