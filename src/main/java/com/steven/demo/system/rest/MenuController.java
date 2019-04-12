package com.steven.demo.system.rest;

import com.steven.demo.system.domain.Menu;
import com.steven.demo.system.service.MenuService;
import com.steven.demo.system.util.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/system/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/tree")
    public List<TreeNode> getDeptTree() {
        List<TreeNode> tree = menuService.getMenuTree();
        return tree;
    }

    @RequestMapping(value = "/list")
    public List<Menu> getAllMenus() {
        List<Menu> menus = menuService.getAllMenus();
        return menus;
    }
}
