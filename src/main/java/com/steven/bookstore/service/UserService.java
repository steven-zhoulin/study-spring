package com.steven.bookstore.service;

import com.steven.bookstore.dao.UserDAO;
import com.steven.bookstore.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Steven
 */
@Service
public class UserService {

    @Autowired
    UserDAO userDAO;

    public User login(User user) {
        return userDAO.login(user.getUserName(), user.getPassword());
    }

}
