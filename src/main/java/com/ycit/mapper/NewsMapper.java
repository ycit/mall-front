package com.ycit.mapper;

import com.ycit.bean.modal.News;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NewsMapper {

    @Select("select * from news order by create_time desc limit #{n}")
    List<News> findTopN(@Param("n")int n);
}
