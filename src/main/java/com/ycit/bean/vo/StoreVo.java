package com.ycit.bean.vo;

import com.ycit.bean.modal.Store;
import com.ycit.bean.modal.StoreBrand;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * 专卖店前端显示类
 *
 * @author xlch
 * @Date 2018-03-30 14:10
 */
public class StoreVo extends Store {

    private List<StoreBrand> brands;

    public static StoreVo fromBean(Store store) {
        StoreVo storeVo = new StoreVo();
        BeanUtils.copyProperties(store, storeVo);
        return storeVo;
    }

    public List<StoreBrand> getBrands() {
        return brands;
    }

    public void setBrands(List<StoreBrand> brands) {
        this.brands = brands;
    }
}
