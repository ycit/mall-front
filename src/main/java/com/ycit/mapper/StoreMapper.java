package com.ycit.mapper;

import com.ycit.bean.criteria.StoresSearchForm;
import com.ycit.bean.modal.Store;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StoreMapper {

    List<Store> finds(@Param("searchForm")StoresSearchForm searchForm);

    @Select("select * from store order by create_time desc limit #{n}")
    List<Store> findNewest(@Param("n")int n);

    @Select("select * from store where id = #{id}")
    Store findById(@Param("id")int id);

}
