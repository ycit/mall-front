package com.ycit.bean.criteria;

/**
 * 商品搜索表单
 *
 * @author xlch
 * @Date 2018-03-30 13:59
 */
public class GoodsSearchForm {
    private String name; //名称
    private Integer brandId; //品牌id
    private Integer categoryId; // 电池种类
    private Integer purposeId; // 电池用途
    private Integer minPrice;
    private Integer maxPrice;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getPurposeId() {
        return purposeId;
    }

    public void setPurposeId(Integer purposeId) {
        this.purposeId = purposeId;
    }

    public Integer getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Integer minPrice) {
        this.minPrice = minPrice;
    }

    public Integer getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Integer maxPrice) {
        this.maxPrice = maxPrice;
    }
}
