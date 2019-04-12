package com.steven.demo.system.service;

import com.steven.demo.system.dao.UserDAO;
import com.steven.demo.system.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author steven.zhou
 */
@Service
public class UserService {

    @Autowired
    UserDAO userDAO;

    public List<User> findAll() {
        return userDAO.findAll();
    }

    public User findOne(String id) {
        return userDAO.findOne(id);
    }

    public int add(User user) {
        return userDAO.add(user);
    }

    public int delete(String username) {
        return userDAO.delete(username);
    }

    public int update(User user) {
        return userDAO.update(user);
    }

}
