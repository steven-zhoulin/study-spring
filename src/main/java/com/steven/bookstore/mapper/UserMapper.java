package com.steven.bookstore.mapper;

import com.steven.bookstore.entities.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author Steven
 */
@Repository
public interface UserMapper {

    @Select("select id, username, password from users where username = #{username} and password = #{password}")
    User login(@Param("username") String username, @Param("password") String password);

}
