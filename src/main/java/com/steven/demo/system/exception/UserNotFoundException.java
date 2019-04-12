package com.steven.demo.system.exception;

/**
 * @author steven.zhou
 */
public class UserNotFoundException extends RuntimeException {

    private String username;

    public UserNotFoundException(String username) {
        this.username = username;
    }

    public String getUsername() {
        return this.username;
    }

}
