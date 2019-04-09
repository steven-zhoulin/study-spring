package com.steven.devops.sys.mapper;

import com.steven.devops.sys.entities.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author steven.zhou
 */
@Repository
public interface UserMapper {

    @Select("select username, password, enabled from sys_users")
    List<User> getAllUsers();

    @Select("select username, password, enabled from sys_users where username = #{username}")
    User getUserByUsername(String username);

    @Insert("insert into sys_users(username, password, enabled) values(#{username}, #{password}, #{enabled})")
    public int add(User user);

    @Delete("delete from sys_users where username = #{username}")
    public int delete(String username);

    @Update("update sys_users set password=#{password}, enabled=#{enabled} where username=#{username}")
    public int update(User user);

}
