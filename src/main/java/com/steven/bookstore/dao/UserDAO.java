package com.steven.bookstore.dao;

import com.steven.bookstore.entities.User;
import com.steven.bookstore.mapper.UserMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

    @Autowired
    UserMapper userMapper;

    public User login(@Param("username") String username, @Param("password") String password) {
        return userMapper.login(username, password);
    }

}
