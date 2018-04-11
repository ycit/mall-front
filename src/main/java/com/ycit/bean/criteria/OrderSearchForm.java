package com.ycit.bean.criteria;

/**
 * 订单查询表单
 *
 * @author xlch
 * @Date 2018-04-10 11:27
 */
public class OrderSearchForm {

    private Long startTime;
    private Long endTime;
    private Integer status; //订单状态
    private String goodsName;
    private String username;

    public Long getStartTime() {
        return startTime;
    }

    public void setStartTime(Long startTime) {
        this.startTime = startTime;
    }

    public Long getEndTime() {
        return endTime;
    }

    public void setEndTime(Long endTime) {
        this.endTime = endTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
