package com.ycit.mapper;

import com.ycit.bean.modal.OrderGoods;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderGoodsMapper {

    @Select("select * from orders_goods where id = #{id}")
    OrderGoods findById(@Param("id")int id);

    @Select("select * from orders_goods where order_id = #{orderId}")
    List<OrderGoods> findByOrderId(@Param("orderId")int orderId);

    int insertBatch(@Param("orderGoodsList")List<OrderGoods> orderGoodsList);

    int insert(@Param("orderGoods")OrderGoods orderGoods);

    @Delete("delete from orders_goods where order_id = #{orderId}")
    int deleteByOrderId(@Param("orderId")int orderId);

}
