package com.steven.demo.system.rest;

import com.steven.demo.system.domain.Dept;
import com.steven.demo.system.service.DeptService;
import com.steven.demo.system.util.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/system/dept")
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping(value = "/tree")
    public List<TreeNode> getDeptTree() {
        List<TreeNode> tree = deptService.getDeptTree();
        return tree;
    }

    @RequestMapping(value = "/list")
    public List<Dept> findAll() {
        List<Dept> depts = deptService.findAll();
        return depts;
    }

    @RequestMapping(value = "/{id}")
    public Dept findOne(@PathVariable("id") String id) {
        return deptService.findOne(id);
    }

}
