package com.ycit.mapper;

import com.ycit.bean.modal.Cart;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartMapper {


    @Insert("insert into cart (user_id, goods_id, goods_count, store_id) values (#{cart.userId}, #{cart.goodsId}, #{cart.goodsCount},  #{cart.storeId})")
    @Options(useGeneratedKeys = true, keyProperty = "cart.id", keyColumn = "cart.id")
    int insert(@Param("cart")Cart cart);

    @Select("select count(1) from cart where user_id = #{userId}")
    int findCount(@Param("userId")int userId);

    @Select("select * from cart where goods_id = #{goodsId} and user_id = #{userId}")
    Cart findByGoodsIdAndUser(@Param("goodsId")int goodsId, @Param("userId")int userId);

    @Update("update cart set goods_count = #{count} where id = #{id}")
    int updateCount(@Param("id") int id, @Param("count") int count);

    @Select("select * from cart where id = #{id}")
    Cart findById(@Param("id")int id);

    @Select("select * from cart where user_id = #{userId}")
    List<Cart> findByUser(@Param("userId")int userId);

    @Select("select * from cart where store_id = #{storeId}")
    List<Cart> findByStore(@Param("storeId")int storeId);

    @Select("select store_id from cart where user_id = #{userId} group by store_id")
    List<Integer> statStore(@Param("userId")int userId);

    @Delete("delete from cart where id = #{id}")
    int deleteById(@Param("id")int id);

    @Delete("delete from cart where id in (${ids})")
    int deleteBatch(@Param("ids")String ids);

    @Delete("delete from cart where user_id = #{userId} and goods_id = #{goodsId}")
    int deleteByUserAndGoods(@Param("userId")int userId, @Param("goodsId")int goodsId);

}
