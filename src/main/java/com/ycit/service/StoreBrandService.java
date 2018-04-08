package com.ycit.service;

import com.ycit.bean.modal.StoreBrand;
import com.ycit.mapper.StoreBrandMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 专卖店 品牌 业务层
 *
 * @author xlch
 * @Date 2018-03-30 15:03
 */
@Service
public class StoreBrandService {

    private StoreBrandMapper storeBrandMapper;

    @Resource
    public void setStoreBrandMapper(StoreBrandMapper storeBrandMapper) {
        this.storeBrandMapper = storeBrandMapper;
    }

    public List<StoreBrand> findByStoreId(int storeId) {
        return storeBrandMapper.findByStoreId(storeId);
    }
}
