package com.ycit.mapper;

import com.ycit.bean.criteria.GoodsSearchForm;
import com.ycit.bean.modal.Goods;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper {

    @Select("select * from goods order by create_time desc limit #{n}")
    List<Goods> topN(@Param("n")int n);

    List<Goods> finds(@Param("searchForm")GoodsSearchForm searchForm);

    @Select("select * from goods order by sale_count desc limit #{n}")
    List<Goods> hot(@Param("n")int n);

    @Select("select * from goods where id = #{id}")
    Goods findById(@Param("id")int id);

    @Update("update goods set stock = stock - #{goodsNum},sale_count = sale_count + #{goodsNum} where stock >= #{goodsNum} and id = #{id}")
    int updateStockAndSaleCountById(@Param("id")int id, @Param("goodsNum")int goodsNum);

}
