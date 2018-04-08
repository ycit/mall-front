package com.ycit.service;

import com.ycit.bean.modal.DictInfo;
import com.ycit.mapper.DictInfoMapper;
import com.ycit.util.ConstantDefine;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 字典表信息 业务层
 *
 * @author xlch
 * @Date 2018-03-30 17:14
 */
@Service
public class DictInfoService {

    private DictInfoMapper dictInfoMapper;

    @Resource
    public void setDictInfoMapper(DictInfoMapper dictInfoMapper) {
        this.dictInfoMapper = dictInfoMapper;
    }

    public List<DictInfo> findByTypeId(int typeId) {
        return dictInfoMapper.findByTypeId(typeId);
    }

    public List<DictInfo> findBrands() {
        return this.findByTypeId(ConstantDefine.DICT_BRAND_ID);
    }

    public List<DictInfo> findCategories() {
        return this.findByTypeId(ConstantDefine.DICT_CATEGORY_ID);
    }

    public List<DictInfo> findUsages() {
        return this.findByTypeId(ConstantDefine.DICT_USAGE_ID);
    }

    public DictInfo findById(int id) {
        return dictInfoMapper.findById(id);
    }

}
