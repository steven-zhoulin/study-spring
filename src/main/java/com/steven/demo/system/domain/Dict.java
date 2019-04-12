package com.steven.demo.system.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

import java.io.Serializable;
import java.util.List;

/**
 * @author
 * @date 2019-04-10
 */
@Getter
@Setter
public class Dict implements Serializable {

    private Long id;
    private String name;
    private String remark;
    private List<DictDetail> dictDetails;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}