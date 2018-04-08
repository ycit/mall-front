package com.ycit.controller;

import com.ycit.bean.criteria.StoresSearchForm;
import com.ycit.bean.modal.Store;
import com.ycit.bean.vo.StoreVo;
import com.ycit.service.DictInfoService;
import com.ycit.service.StoreService;
import com.ycit.service.builder.StoreVoBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 专卖店控制层
 *
 * @author xlch
 * @Date 2018-03-30 13:56
 */
@Controller
@RequestMapping("/front")
public class StoreController {

    private StoreService storeService;

    @Resource
    public void setStoreService(StoreService storeService) {
        this.storeService = storeService;
    }

    private StoreVoBuilder storeVoBuilder;

    @Resource
    public void setStoreVoBuilder(StoreVoBuilder storeVoBuilder) {
        this.storeVoBuilder = storeVoBuilder;
    }

    private DictInfoService dictInfoService;

    @Resource
    public void setDictInfoService(DictInfoService dictInfoService) {
        this.dictInfoService = dictInfoService;
    }

    @RequestMapping(value = "/stores", method = RequestMethod.GET)
    public String searchHome(@RequestParam(value = "name", required = false, defaultValue = "")String name,
                             @RequestParam(value = "brandId", required = false, defaultValue = "0")Integer brandId,
                             Model model) {
        model.addAttribute("name", name);
        model.addAttribute("brandId", brandId);
        model.addAttribute("brands", dictInfoService.findBrands());
        model.addAttribute("stores", storeVoBuilder.buildList(storeService.newest(5)));
        return "/store-search";
    }

    @ResponseBody
    @RequestMapping(value = "/stores", method = RequestMethod.POST)
    public List<StoreVo> search(@Valid StoresSearchForm storesSearchForm) {
        List<Store> stores =  storeService.finds(storesSearchForm);
        return storeVoBuilder.buildList(stores);
    }

}
