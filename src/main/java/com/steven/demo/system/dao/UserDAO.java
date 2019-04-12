package com.steven.demo.system.dao;

import com.steven.demo.system.domain.User;
import com.steven.demo.system.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author steven.zhou
 */
@Repository
public class UserDAO {

    @Autowired
    UserMapper userMapper;

    public List<User> findAll() {
        List<User> users = userMapper.findAll();
        return users;
    }

    public User findOne(String id) {
        return userMapper.findOne(id);
    }

    public int add(User user) {
        return userMapper.add(user);
    }

    public int delete(String username) {
        return userMapper.delete(username);
    }

    public int update(User user) {
        return userMapper.update(user);
    }

}
