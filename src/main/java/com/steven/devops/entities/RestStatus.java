package com.steven.devops.entities;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RestStatus {
    private boolean success;
    private String errorMsg;
}
