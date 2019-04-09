package com.steven.devops.sys.service;

import com.steven.devops.sys.dao.UserDAO;
import com.steven.devops.sys.entities.User;
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

    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    public User getUserByUsername(String username) {
        return userDAO.getUserByUsername(username);
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
