package com.ycit.controller;

import com.ycit.bean.modal.Cart;
import com.ycit.bean.modal.User;
import com.ycit.bean.vo.CartGoodsVo;
import com.ycit.bean.vo.CartVo;
import com.ycit.service.CartService;
import com.ycit.service.UserService;
import com.ycit.service.builder.CartVoBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 购物车 控制层
 *
 * @author xlch
 * @Date 2018-04-04 15:12
 */
@Controller
@RequestMapping("/front")
public class CartController {

    private CartService cartService;

    private UserService userService;

    private CartVoBuilder cartVoBuilder;

    @Resource
    public void setCartVoBuilder(CartVoBuilder cartVoBuilder) {
        this.cartVoBuilder = cartVoBuilder;
    }

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Resource
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    @ResponseBody
    @RequestMapping( value = "/cart/add", method = RequestMethod.POST)
    public CartVo addGoods(Cart cart) {
        cart.setUserId(userService.getCurrent().getId());
        return cartService.doAddGoods(cart);
    }

    @ResponseBody
    @RequestMapping("/cart/count")
    public int findCount() {
        User user = userService.getCurrent();
        return cartService.findCount(user.getId());
    }

    /**
     * 购物车页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/cart")
    public String cart(Model model) {
        User user = userService.getCurrent();
        model.addAttribute("user", user);
        return "/cart";
    }

    @ResponseBody
    @RequestMapping(value = "/cart/list", method = RequestMethod.GET)
    public List<CartGoodsVo> list() {
        User user = userService.getCurrent();
        return cartService.findCarts(user.getId());
    }

    @ResponseBody
    @RequestMapping(value = "/cart/{id}/delete", method = RequestMethod.GET)
    public int delete(@PathVariable("id")int id) {
        return cartService.deleteById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/cart/delete/batch", method = RequestMethod.GET)
    public int batchDelete(@RequestParam("ids") String ids) {
        return cartService.deleteBatch(ids);
    }

}
