package com.ycit.controller;

import com.ycit.bean.criteria.GoodsSearchForm;
import com.ycit.bean.modal.Goods;
import com.ycit.bean.vo.GoodsVo;
import com.ycit.service.DictInfoService;
import com.ycit.service.GoodsService;
import com.ycit.service.builder.GoodsVoBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 商品控制层
 *
 * @author xlch
 * @Date 2018-03-30 13:55
 */
@Controller
@RequestMapping("/front")
public class GoodsController {

    private GoodsService goodsService;

    private DictInfoService dictInfoService;

    private GoodsVoBuilder goodsVoBuilder;

    @Resource
    public void setGoodsVoBuilder(GoodsVoBuilder goodsVoBuilder) {
        this.goodsVoBuilder = goodsVoBuilder;
    }

    @Resource
    public void setDictInfoService(DictInfoService dictInfoService) {
        this.dictInfoService = dictInfoService;
    }

    @Resource
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @RequestMapping(value = "/goodses", method = RequestMethod.GET)
    public String searchHome(@RequestParam(value = "name", required = false, defaultValue = "")String name,
                             Model model) {
        model.addAttribute("goodses", goodsService.hot(5));
        model.addAttribute("brands", dictInfoService.findBrands());
        model.addAttribute("categories", dictInfoService.findCategories());
        model.addAttribute("usages", dictInfoService.findUsages());
        model.addAttribute("name", name);
        return "/goods-search";
    }

    @ResponseBody
    @RequestMapping(value = "/goodses", method = RequestMethod.POST)
    public List<GoodsVo> search(@Valid GoodsSearchForm searchForm) {
        List<Goods> goods =  goodsService.finds(searchForm);
        return goodsVoBuilder.buildList(goods);
    }

    @RequestMapping(value = "/goodses/{id}/detail", method = RequestMethod.GET)
    public String detail(@PathVariable("id")int id, Model model) {
        model.addAttribute("goods", goodsVoBuilder.buildOne(goodsService.findById(id)));
        return "/goods-detail";
    }

}
