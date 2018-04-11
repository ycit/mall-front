package com.ycit.controller;

import com.ycit.bean.base.ApiResponse;
import com.ycit.bean.criteria.PasswordForm;
import com.ycit.bean.modal.User;
import com.ycit.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.ArrayList;

/**
 * 用户管理层
 *
 * @author xlch
 * @Date 2018-03-21 13:32
 */
@Controller
@RequestMapping("/front")
public class UserController extends BaseController {

    private UserService userService;

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 个人信息页面
     * @param model
     * @return
     */
    @RequestMapping("/users/info")
    public String home(Model model) {
        User user = userService.getCurrent();
        model.addAttribute("user", user);
        return "/user-info";
    }

    @ResponseBody
    @RequestMapping(value = "/users/self", method = RequestMethod.GET)
    public User getInfo() {
        return userService.getCurrent();
    }

    @ResponseBody
    @RequestMapping(value = "/users/update", method = RequestMethod.POST)
    public User update(User user) {
        return userService.updateById(user);
    }

    @ResponseBody
    @RequestMapping(value = "/users/img/upload", method = RequestMethod.POST)
    public User uploadImg(MultipartFile img) {
        userService.uploadImg(img);
        return userService.getCurrent();
    }

    /**
     * 修改密码请求
     * @param form 密码表单
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/users/pw", method = RequestMethod.GET)
    public ApiResponse<String> changePw(PasswordForm form) {
        String msg =  userService.doChangePw(form);
        if (StringUtils.isNotBlank(msg)) {
            return error(400, msg);
        } else {
            return success(new ArrayList(), 0);
        }
    }

}
