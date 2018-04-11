package com.ycit.controller;

import com.ycit.bean.base.ApiResponse;
import com.ycit.bean.criteria.OrderSearchForm;
import com.ycit.bean.modal.Order;
import com.ycit.bean.vo.OrderVo;
import com.ycit.service.OrderService;
import com.ycit.service.builder.OrderVoBuilder;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * 订单 控制层
 *
 * @author xlch
 * @Date 2018-04-08 9:48
 */
@Controller
@RequestMapping("/front")
public class OrderController extends BaseController {

    private OrderService orderService;

    private OrderVoBuilder orderVoBuilder;

    @Resource
    public void setOrderVoBuilder(OrderVoBuilder orderVoBuilder) {
        this.orderVoBuilder = orderVoBuilder;
    }

    @Resource
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    /**
     * 订单结算
     * @param order
     * @return
     */
    @ResponseBody
    @RequestMapping("/order/state")
    public ApiResponse<String> orderStatement(@RequestBody OrderVo order) {
        String msg =  orderService.doPay(order);
        if (StringUtils.isBlank(msg)) {
            return success(new ArrayList(), 0);
        } else {
            return error(400, msg);
        }
    }

    /**
     * 我的订单页面
     * @return
     */
    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public String orderHome() {
        return "/order";
    }

    /**
     * 查询订单
     * @param searchForm
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/orders", method = RequestMethod.POST)
    public ApiResponse<OrderVo> finds(@Valid OrderSearchForm searchForm) {
        List<Order> orders = orderService.finds(searchForm);
        List<OrderVo> orderVos = orderVoBuilder.builds(orders);
        return success(orderVos, orders.size());
    }

    /**
     * 确认收货
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/orders/receive", method = RequestMethod.GET)
    public int sendGoods(@RequestParam("id")int id) {
        return orderService.updateStatusById(id, 2);
    }

    /**
     * 删除订单
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/orders/delete", method = RequestMethod.GET)
    public int delete(@RequestParam("id")int id) {
        return orderService.doDeleteOrder(id);
    }

}
