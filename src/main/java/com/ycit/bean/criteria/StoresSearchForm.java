package com.ycit.bean.criteria;

/**
 * 专卖店搜索表单
 *
 * @author xlch
 * @Date 2018-03-30 13:59
 */
public class StoresSearchForm {

    private String name;
    private Integer brandId;
    private Integer provinceId;
    private Integer cityId;

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

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }
}
