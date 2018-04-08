package com.ycit.controller;

import com.ycit.bean.criteria.RegForm;
import com.ycit.bean.modal.User;
import com.ycit.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.stream.Collectors;

/**
 * 注册控制层
 *
 * @author xlch
 * @Date 2018-03-21 15:31
 */
@Controller
@RequestMapping("/front")
public class RegisterController {

    private UserService userService;

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String home() {
        return "/register";
    }

    @ResponseBody
    @PostMapping(value = "/register", produces = "application/json;charset=UTF-8;")
    public String register(@Valid RegForm regForm, BindingResult result) {
        String msg = null;
        if (result.hasErrors()) {
            msg =  result.getAllErrors().stream().map(ObjectError::getDefaultMessage).collect(Collectors.joining(","));
        }
        String username = regForm.getUsername();
        String password = regForm.getPassword();
        String rePassword = regForm.getRePassword();
        if (!password.equals(rePassword)) {
            msg = "两次密码不一致";
        }
        User userByUsername = userService.findByUsername(username);
        if (userByUsername != null) {
            msg = "用户名已存在";
        }
        if (StringUtils.isNotEmpty(msg)) {
            return msg;
        }
        User user = User.fromBean(regForm);
        userService.insert(user);
        return "success";
    }

}
