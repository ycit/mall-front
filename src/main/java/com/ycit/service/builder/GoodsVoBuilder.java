package com.ycit.service.builder;

import com.ycit.bean.modal.DictInfo;
import com.ycit.bean.modal.Goods;
import com.ycit.bean.modal.Store;
import com.ycit.bean.vo.GoodsVo;
import com.ycit.service.DictInfoService;
import com.ycit.service.StoreService;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * goodsVo 构建类
 *
 * @author xlch
 * @Date 2018-04-02 10:24
 */
@Service
public class GoodsVoBuilder {

    private DictInfoService dictInfoService;

    private StoreService storeService;

    @Resource
    public void setStoreService(StoreService storeService) {
        this.storeService = storeService;
    }

    @Resource
    public void setDictInfoService(DictInfoService dictInfoService) {
        this.dictInfoService = dictInfoService;
    }

    public GoodsVo buildOne(Goods goods) {
        GoodsVo goodsVo = GoodsVo.fromBean(goods);
        DictInfo brandInfo = goods.getBrandId() == null? null: dictInfoService.findById(goods.getBrandId());
        Store storeInfo = goods.getStoreId() == null ? null: storeService.findById(goods.getStoreId());
        DictInfo categoryInfo = goods.getCategoryId() == null ? null :dictInfoService.findById(goods.getCategoryId());
        DictInfo purposeInfo = goods.getPurposeId() == null ? null : dictInfoService.findById(goods.getPurposeId());
        goodsVo.setBrand(brandInfo);
        goodsVo.setStore(storeInfo);
        goodsVo.setCategory(categoryInfo);
        goodsVo.setPurpose(purposeInfo);
        return goodsVo;
    }

    public List<GoodsVo> buildList(List<Goods> goodses) {
        List<GoodsVo> goodsVos = new ArrayList<>();
        if (!CollectionUtils.isEmpty(goodses)) {
            goodses.forEach(goods -> {
                GoodsVo goodsVo = buildOne(goods);
                goodsVos.add(goodsVo);
            });
        }
        return goodsVos;
    }

}
