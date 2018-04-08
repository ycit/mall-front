package com.ycit.controller;

import com.ycit.bean.base.ApiResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * 异常拦截
 *
 * @author xlch
 * @Date 2018-04-03 17:18
 */
@RestControllerAdvice(annotations = RestController.class)
public class ExceptionController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ExceptionController.class);

    @ExceptionHandler
    @ResponseBody
    public ApiResponse generalError(Exception ex, HttpServletRequest request) {
        LOGGER.error("Error 500: {}, {}", ex.getMessage(), ex.getStackTrace()[0]);
        ex.printStackTrace();
        ApiResponse apiResponse = new ApiResponse();
        apiResponse.setCode(500);
        apiResponse.setMessage("服务器内部错误");
        return apiResponse;
    }

}
