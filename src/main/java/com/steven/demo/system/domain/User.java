package com.steven.demo.system.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * @author
 * @date 2018-11-22
 */
@Getter
@Setter
public class User implements Serializable {


    private Long id;
    private String username;
    private String avatar;
    private String email;
    private String phone;
    private Boolean enabled;
    private String password;
    private Timestamp createTime;
    private Date lastPasswordResetTime;
//    private Set<Role> roles;
    private Job job;
    private Dept dept;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}
