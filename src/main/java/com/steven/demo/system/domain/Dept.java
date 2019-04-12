package com.steven.demo.system.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author
 * @date 2019-03-25
 */
@Getter
@Setter
public class Dept implements Serializable {

    private Long id;
    private String name;
    private Boolean enabled;
    private Long pid;
    private Timestamp createTime;
    //private Set<Role> roles;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}