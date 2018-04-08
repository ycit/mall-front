package com.ycit.service;

import com.ycit.bean.criteria.StoresSearchForm;
import com.ycit.bean.modal.Store;
import com.ycit.mapper.StoreMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 专卖店 业务层
 *
 * @author xlch
 * @Date 2018-03-30 14:50
 */
@Service
public class StoreService {

    private StoreMapper storeMapper;

    @Resource
    public void setStoreMapper(StoreMapper storeMapper) {
        this.storeMapper = storeMapper;
    }

    public List<Store> finds(StoresSearchForm storesSearchForm) {
        return storeMapper.finds(storesSearchForm);
    }

    public List<Store> newest(int n) {
        return storeMapper.findNewest(n);
    }

    public Store findById(int id) {
        return storeMapper.findById(id);
    }
}
