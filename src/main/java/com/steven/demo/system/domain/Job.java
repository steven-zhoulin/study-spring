package com.steven.demo.system.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author
 * @date 2019-03-29
 */
@Getter
@Setter
public class Job implements Serializable {

    private Long id;
    private String name;
    private Long sort;
    private Boolean enabled;
    private Dept dept;
    private Timestamp createTime;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }


}