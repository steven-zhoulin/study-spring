package com.steven.demo.system.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

/**
 * 角色
 * @author
 * @date 2018-11-22
 */

@Getter
@Setter
public class Role implements Serializable {


    private Long id;
    private String name;
    private String dataScope = "本级";
    private String remark;
    private Set<User> users;
    private Set<Permission> permissions;
    private Set<Menu> menus;
    private Set<Dept> depts;
    private Timestamp createTime;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}
