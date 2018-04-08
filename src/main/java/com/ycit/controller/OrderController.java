package com.ycit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 订单 控制层
 *
 * @author xlch
 * @Date 2018-04-08 9:48
 */
@Controller
@RequestMapping("/front")
public class OrderController {

    /**
     * 订单结算页面
     * @return
     */
    @RequestMapping("/order/state")
    public String orderStatement() {
        return "/order-statement";
    }

}
