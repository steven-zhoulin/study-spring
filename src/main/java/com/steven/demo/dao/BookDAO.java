package com.steven.demo.dao;

import com.steven.demo.entities.Book;
import com.steven.demo.mapper.BookMapper;
import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAO {

    @Autowired
    BookMapper bookMapper;

    public List<Book> getAllBooks() {
        return bookMapper.getAllBooks();
    }

    public Book getBookById(@Param("id") int id) {
        return bookMapper.getBookById(id);
    }

    /**
     * 添加图书
     */
    public int add(Book entity) {
        return bookMapper.add(entity);
    }

    /**
     * 根据图书编号删除图书
     */
    public int delete(int id) {
        return bookMapper.delete(id);
    }

    /**
     * 更新图书
     */
    public int update(Book entity) {
        return bookMapper.update(entity);
    }
}