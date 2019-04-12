package com.steven.demo.system.dao;

import com.steven.demo.system.domain.Dept;
import com.steven.demo.system.domain.Menu;
import com.steven.demo.system.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author steven.zhou
 */
@Repository
public class MenuDAO {

    @Autowired
    MenuMapper menuMapper;

    public List<Menu> getAllMenus() {
        return menuMapper.getAllMenus();
    }

    public int add(Menu menu) {
        return menuMapper.add(menu);
    }

    public int delete(String id) {
        return menuMapper.delete(id);
    }

    public int update(Menu menu) {
        return menuMapper.update(menu);
    }

}
