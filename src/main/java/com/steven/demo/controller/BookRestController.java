package com.steven.demo.controller;

import com.steven.demo.entities.Book;
import com.steven.demo.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/book-rest")
public class BookRestController {

    @Autowired
    BookService bookservice;

    @ResponseBody
    @RequestMapping(value = "/list")
    public List<Book> restHome() {
        List<Book> books = bookservice.getAllBooks();
        return books;
    }

    @ResponseBody
    @RequestMapping(value = "/add")
    public String addBookPost(Book book) {

        String message;
        try {
            message = bookservice.add(book) > 0 ? "添加成功！" : "添加失败！";
        } catch (Exception exp) {
            message = exp.getMessage();
            exp.printStackTrace();
        }

        return message;
    }

    @ResponseBody
    @RequestMapping(value = "/edit")
    public String editPost(Book book) {
        System.out.println("=========================");
        System.out.println(book.toString());
        System.out.println("=========================");
        String message;
        try {
            message = bookservice.update(book) > 0 ? "更新成功！" : "更新失败！";
        } catch (Exception exp) {
            message = exp.getMessage();
            exp.printStackTrace();
        }

        return message;
    }

    @ResponseBody
    @RequestMapping(value = "/delete")
    public String deleteBook(@RequestParam("id") int id) {
        String message;
        try {
            message = bookservice.delete(id) > 0 ? "删除成功！" : "删除失败！";
        } catch (Exception exp) {
            message = exp.getMessage();
            exp.printStackTrace();
        }
        return message;
    }
}
