package com.steven.bookstore.entities;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

@Setter
@Getter
public class User {
    private Integer id;
    private String userName;
    private String password;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
