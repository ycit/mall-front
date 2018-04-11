package com.ycit.mapper;

import com.ycit.bean.modal.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    @Select("select * from USER where username = #{username}")
    User findByUsername(@Param("username")String username);

    @Update("update USER set balance = balance + #{num} where id = #{id} ")
    int updateBalance(@Param("id")int id, @Param("num")int num);

    @Delete("delete from USER where id = #{id}")
    int deleteById(@Param("id")int id);

    @Select("select * from USER")
    List<User> finds();

    @Select("select * from USER where id = #{id}")
    User findById(@Param("id") int id);

    @Insert("insert USER (username,password) values (#{user.username},#{user.password})")
    @Options(useGeneratedKeys = true, keyProperty = "user.id", keyColumn = "user.id")
    int insert(@Param("user")User user);

    @Update("update user set balance = balance - #{cost} where balance >= #{cost} and id = #{id}")
    int updateBalanceById(@Param("id")int id, @Param("cost")int cost);

    @Update("update user set nickname = #{user.nickname}, sex = #{user.sex}," +
            "birthday = #{user.birthday}, modify_time = sysdate() where id = #{user.id}")
    int updateById(@Param("user")User user);

    @Update("update user set img = #{img} where id = #{id}")
    int updateImg(@Param("id")int id, @Param("img")String img);

    @Select("select password from user where id = #{id}")
    String findPwById(@Param("id")int id);

    @Update("update user set password = #{pw} where id = #{id}")
    int updatePwById(@Param("id")int id, @Param("pw")String pw);

    @Select("select password from user where username = #{username}")
    String findPwByUsername(@Param("username")String username);

}
