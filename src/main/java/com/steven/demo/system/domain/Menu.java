package com.steven.demo.system.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

/**
 * @author
 * @date 2018-12-17
 */
@Getter
@Setter
public class Menu implements Serializable {


    private Long id;
    private String name;
    private Long sort;
    private String path;
    private String component;
    private String icon;
    private Long pid;
    private Boolean iFrame;
    private Set<Role> roles;
    private Timestamp createTime;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}