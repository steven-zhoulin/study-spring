package com.steven.demo.system.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

/**
 * @author
 * @date 2018-12-03
 */

@Getter
@Setter
public class Permission implements Serializable{

    private Long id;
    private String name;
    private Long pid;
    private String alias;
    private Set<Role> roles;
    private Timestamp createTime;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}