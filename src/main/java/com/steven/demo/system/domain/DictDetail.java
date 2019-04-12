package com.steven.demo.system.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;

/**
 * @author
 * @date 2019-04-10
 */

@Getter
@Setter
public class DictDetail implements Serializable {

    private Long id;
    private String label;
    private String value;
    private String sort = "999";
    private Dict dict;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}