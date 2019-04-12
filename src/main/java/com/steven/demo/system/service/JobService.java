package com.steven.demo.system.service;

import com.steven.demo.system.dao.DeptDAO;
import com.steven.demo.system.domain.Dept;
import com.steven.demo.system.util.TreeNode;
import com.steven.demo.system.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author steven.zhou
 */
@Service
public class JobService {

    @Autowired
    DeptDAO deptDAO;

    public List<Dept> findAll() {
        return deptDAO.findAll();
    }

    public Dept findOne(String dept_id) {
        return deptDAO.findOne(dept_id);
    }

    public List<TreeNode> getDeptTree() {
        List<Dept> deptList = findAll();
        List<TreeNode> nodeList = transform(deptList);
        List<TreeNode> tree = TreeUtil.getRootNode(nodeList);
        return tree;
    }

    private List<TreeNode> transform(List<Dept> deptList) {
        List<TreeNode> nodeList = new ArrayList<>();

        for (Dept dept : deptList) {
            TreeNode treeNode = new TreeNode();
            treeNode.setId(String.valueOf(dept.getId()));
            treeNode.setPid(String.valueOf(dept.getPid()));
            treeNode.setText(dept.getName());

            nodeList.add(treeNode);
        }

        return nodeList;
    }

    public int add(Dept dept) {
        return deptDAO.add(dept);
    }

    public int delete(String id) {
        return deptDAO.delete(id);
    }

    public int update(Dept dept) {
        return deptDAO.update(dept);
    }

}
