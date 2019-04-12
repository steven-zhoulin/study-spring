package com.steven.demo.system.exception;

/**
 * @author steven.zhou
 */
public class RoleNotFoundException extends RuntimeException {

    private int id;

    public RoleNotFoundException(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

}
