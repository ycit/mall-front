package com.ycit.mapper;

import com.ycit.bean.modal.Address;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AddressMapper {

    int insert(@Param("address")Address address);

    @Select("select * from user_address where id = #{id}")
    Address findById(@Param("id")int id);

    @Select("select * from user_address where user_id = #{userId}")
    List<Address> findByUserId(@Param("userId")int userId);

    @Delete("delete from user_address where id = #{id}")
    int deleteById(@Param("id")int id);

    int updateById(@Param("address")Address address);

    @Update("update user_address set default_addr = 1 where id = #{id}")
    int updateDefualtAddrById(@Param("id")int id);

    @Update("update user_address set default_addr = 0 where user_id = #{userId} and default_addr = 1")
    int updateDefualtAddrByUser(@Param("userId")int userId);

}
