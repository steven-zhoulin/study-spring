package com.steven.devops.entities;


import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 图书实体
 */
@Setter
@Getter
public class Book {

    /**
     * 编号
     */
    private int id;

    /**
     * 书名
     */
    private String title;

    /**
     * 价格
     */
    private double price;

    /**
     * 出版日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date publishDate;

    public Book() {
    }

    public Book(int id, String title, double price, Date publishDate) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.publishDate = publishDate;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
