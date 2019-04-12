package com.steven.demo.controller;

import com.steven.demo.entities.Book;
import com.steven.demo.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/book")
public class BookController {

    @Autowired
    BookService bookservice;

    @RequestMapping(value = "/list", method = GET)
    public String home(Model model) {
        List<Book> books = bookservice.getAllBooks();
        model.addAttribute("books", books);
        return "home";
    }

    @RequestMapping(value = "/edit", method = GET)
    public String editBook(@RequestParam("id") int id, Model model) {
        Book book = bookservice.getBookById(id);
        model.addAttribute("model", book);
        return "editBook";
    }

    @RequestMapping(value = "/editPost", method = POST)
    public String editPost(Book book, Model model) {
        try {
            model.addAttribute("message", bookservice.update(book) > 0 ? "更新成功！" : "更新失败！");
            model.addAttribute("model", book);
        } catch (Exception exp) {
            model.addAttribute("message", exp.getMessage());
            exp.printStackTrace();
        }
        return "editBook";
    }

    @RequestMapping(value = "/add", method = GET)
    public String addBook() {
        return "addBook";
    }

    @RequestMapping(value = "/addPost", method = POST)
    public String addBookPost(Book book, Model model) {
        try {
            model.addAttribute("message", bookservice.add(book) > 0 ? "添加成功！" : "添加失败！");
            model.addAttribute("model", book);
        } catch (Exception exp) {
            model.addAttribute("message", exp.getMessage());
            exp.printStackTrace();
        }
        return "addBook";
    }

    @RequestMapping(value = "/delete")
    public String deleteBook(@RequestParam("id") int id, Model model) {
        model.addAttribute("message", bookservice.delete(id) > 0 ? "删除成功！" : "删除失败！");
        List<Book> books = bookservice.getAllBooks();
        model.addAttribute("books", books);
        return "home";
    }

    @RequestMapping(value = "/deletes")
    public String deleteBooks(HttpServletRequest request, Model model) {
        String[] ids = request.getParameterValues("ids");
        if (ids != null && ids.length > 0) {
            int count = 0;
            for (String id : ids) {
                bookservice.delete(Integer.parseInt(id));
                count++;
            }
            model.addAttribute("message", count > 0 ? "删除成功！" : "删除失败！");
        } else {
            model.addAttribute("message", "请选择删除项！");
        }
        model.addAttribute("books", bookservice.getAllBooks());

        return "home";
    }



}
