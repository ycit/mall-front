package com.ycit.bean.base;

import java.util.List;

/**
 * 统一返回数据结构
 *
 * @author xlch
 * @Date 2018-04-03 17:21
 */
public class ApiResponse<T> {
    private List<T> result;
    private String message;
    private int code;
    private int total;

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
