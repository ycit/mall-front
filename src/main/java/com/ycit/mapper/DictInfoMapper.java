package com.ycit.mapper;

import com.ycit.bean.modal.DictInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DictInfoMapper {

    @Select("select * from dict_info where type_id = #{typeId}")
    List<DictInfo> findByTypeId(@Param("typeId")int typeId);

    @Select("select * from dict_info where id = #{id}")
    DictInfo findById(@Param("id")int id);

}
