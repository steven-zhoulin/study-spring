package com.steven.bookstore.mapper;

import com.steven.bookstore.entities.Book;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {

    @Select("select id, title, price, publishDate from books")
    public List<Book> getAllBooks();

    @Select("select id, title, price, publishDate from books where id=#{id}")
    Book getBookById(@Param("id") int id);

    /**
     * 添加图书
     */
    @Insert("insert into books(title, price, publishDate) values(#{title}, #{price}, #{publishDate})")
    public int add(Book entity);

    /**
     * 根据图书编号删除图书
     */
    @Delete("delete from books where id=#{id}")
    public int delete(int id);

    /**
     * 更新图书
     */
    @Update("update books set title=#{title}, price=#{price}, publishDate=#{publishDate} where id=#{id}")
    public int update(Book entity);

}
