package com.steven.devops.sys.entities;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 用户
 *
 * @author steven.zhou
 */
@Setter
@Getter
public class User {

    private String username;
    private String password;
    private boolean enabled;

//    public void setPassword(String password) {
//        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//        this.password = encoder.encode(password);
//    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
