package com.ycit.mapper;

import com.ycit.bean.criteria.OrderSearchForm;
import com.ycit.bean.modal.Order;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {

    int insert(@Param("order")Order order);

    @Select("select * from orders where id = #{id}")
    Order findById(@Param("id")int id);

    @Select("select * from orders where user_id = #{userId} order by create_time desc")
    List<Order> findByUser(@Param("userId")int userId);

    List<Order> finds(@Param("searchForm")OrderSearchForm searchForm);

    @Update("update orders set status = #{status},receive_time = sysdate() where id = #{id}")
    int updateStatusById(@Param("id")int id, @Param("status")int status);

    @Delete("delete from orders where id = #{id}")
    int deleteById(@Param("id")int id);

}
