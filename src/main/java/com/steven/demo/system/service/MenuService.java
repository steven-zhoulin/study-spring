package com.steven.demo.system.service;

import com.steven.demo.system.dao.MenuDAO;
import com.steven.demo.system.domain.Menu;
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
public class MenuService {

    @Autowired
    MenuDAO menuDAO;

    public List<Menu> getAllMenus() {
        return menuDAO.getAllMenus();
    }

    public List<TreeNode> getMenuTree() {
        List<Menu> menuList = getAllMenus();
        List<TreeNode> nodeList = transform(menuList);
        List<TreeNode> tree = TreeUtil.getRootNode(nodeList);
        return tree;
    }

    private List<TreeNode> transform(List<Menu> deptList) {
        List<TreeNode> nodeList = new ArrayList<>();

        for (Menu menu : deptList) {
            TreeNode treeNode = new TreeNode();
            treeNode.setId(String.valueOf(menu.getId()));
            treeNode.setPid(String.valueOf(menu.getPid()));
            treeNode.setText(menu.getName());
            treeNode.setUrl(menu.getPath());

            nodeList.add(treeNode);
        }

        return nodeList;
    }

    public int add(Menu menu) {
        return menuDAO.add(menu);
    }

    public int delete(String id) {
        return menuDAO.delete(id);
    }

    public int update(Menu menu) {
        return menuDAO.update(menu);
    }

}
