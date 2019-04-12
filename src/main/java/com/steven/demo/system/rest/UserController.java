package com.steven.demo.system.rest;

import com.steven.demo.Error;
import com.steven.demo.entities.RestStatus;
import com.steven.demo.system.domain.User;
import com.steven.demo.system.exception.UserNotFoundException;
import com.steven.demo.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/system/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/list")
    public List<User> findAll() {
        List<User> users = userService.findAll();
        return users;
    }

    @RequestMapping(value = "/{id}")
    public User findOne(@PathVariable("id") String id) {
        User user = userService.findOne(id);
        return user;
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public int add(User user) {
        int code = userService.add(user);
        return code;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public int update(User user) {
        int code = userService.update(user);
        return code;
    }

    @RequestMapping(value = "/{user_id}", method = RequestMethod.DELETE)
    public RestStatus delete(@PathVariable("user_id") String user_id) {
        int ret = userService.delete(user_id);
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
