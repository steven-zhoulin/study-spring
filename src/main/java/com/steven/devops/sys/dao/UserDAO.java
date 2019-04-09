package com.steven.devops.sys.dao;

import com.steven.devops.sys.entities.User;
import com.steven.devops.sys.mapper.UserMapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
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

    public List<User> getAllUsers() {
        return userMapper.getAllUsers();
    }

    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
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
