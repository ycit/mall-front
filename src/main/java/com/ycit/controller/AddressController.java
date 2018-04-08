package com.ycit.controller;

import com.ycit.bean.modal.Address;
import com.ycit.bean.modal.User;
import com.ycit.service.AddressService;
import com.ycit.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 地址管理控制层
 *
 * @author xlch
 * @Date 2018-04-08 11:48
 */
@Controller
@RequestMapping("/front")
public class AddressController {

    private AddressService addressService;

    private UserService userService;

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Resource
    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    /**
     * 地址新增请求
     * @param address
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/address/add", method = RequestMethod.POST)
    public Address insert(Address address) {
        User user = userService.getCurrent();
        address.setUserId(user.getId());
        return addressService.insert(address);
    }

    /**
     * 地址删除
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/address/delete", method = RequestMethod.GET)
    public int delete(@RequestParam("id")int id) {
        return addressService.deleteById(id);
    }

    /**
     * 地址更新
     * @param address
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/address/update", method = RequestMethod.POST)
    public Address edit(Address address) {
        addressService.updateById(address);
        return addressService.findById(address.getId());
    }

    /**
     * 设置默认地址
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/address/update/status", method = RequestMethod.GET)
    public int updateStatus(@RequestParam("id")int id ) {
        return addressService.doUpdateDefault(id);
    }

    @ResponseBody
    @RequestMapping(value = "/address", method = RequestMethod.GET)
    public List<Address> finds() {
        User user = userService.getCurrent();
        return addressService.findByUserId(user.getId());
    }

    @ResponseBody
    @RequestMapping("/address/{id}")
    public Address findById(@PathVariable("id")int id) {
        return addressService.findById(id);
    }

}
