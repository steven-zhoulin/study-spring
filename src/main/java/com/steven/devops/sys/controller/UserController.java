package com.steven.devops.sys.controller;

import com.steven.devops.Error;
import com.steven.devops.entities.RestStatus;
import com.steven.devops.sys.entities.User;
import com.steven.devops.sys.exception.UserNotFoundException;
import com.steven.devops.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/sys/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/list")
    public List<User> getAllUsers() {
        List<User> users = userService.getAllUsers();
        return users;
    }

    @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    public User getUserByUsername(@PathVariable("username") String username) {
        User user = userService.getUserByUsername(username);
        if (null == user) {
            throw new UserNotFoundException(username);
        }
        return user;
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public int add(User user) {
        return userService.add(user);
    }

    @RequestMapping(value = "/{username}", method = RequestMethod.PUT)
    public int update(User user) {
        return userService.update(user);

    }

    @RequestMapping(value = "/{username}", method = RequestMethod.DELETE)
    public RestStatus delete(@PathVariable("username") String username) {
        int ret = userService.delete(username);
        RestStatus restStatus = new RestStatus();
        if (1 == ret) {
            restStatus.setSuccess(true);
        } else {
            restStatus.setSuccess(true);
            restStatus.setErrorMsg("删除失败!");
        }
        return restStatus;
    }

    /**
     * 错误处理，处理特定的异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(UserNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public Error userNotFound(UserNotFoundException e) {
        String username = e.getUsername();
        return new Error(4, "User [" + username + "] not found!");
    }

}
