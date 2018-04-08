package com.ycit.service.builder;

import com.ycit.bean.modal.Store;
import com.ycit.bean.modal.StoreBrand;
import com.ycit.bean.vo.StoreVo;
import com.ycit.service.StoreBrandService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 构建类
 *
 * @author xlch
 * @Date 2018-03-30 15:00
 */

@Service
public class StoreVoBuilder {

    private StoreBrandService storeBrandService;

    @Resource
    public void setStoreBrandService(StoreBrandService storeBrandService) {
        this.storeBrandService = storeBrandService;
    }

    public StoreVo buildOne(Store store) {
        StoreVo storeVo = StoreVo.fromBean(store);
        List<StoreBrand> storeBrands = storeBrandService.findByStoreId(store.getId());
        storeVo.setBrands(storeBrands);
        return storeVo;
    }

    public List<StoreVo> buildList(List<Store> stores) {
        List<StoreVo> storeVos = new ArrayList<>();
        stores.forEach(store -> {
            StoreVo storeVo = this.buildOne(store);
            storeVos.add(storeVo);
        });
        return storeVos;
    }

}
