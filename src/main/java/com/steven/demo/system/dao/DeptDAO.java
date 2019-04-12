package com.steven.demo.system.dao;

import com.steven.demo.system.domain.Dept;
import com.steven.demo.system.mapper.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author steven.zhou
 */
@Repository
public class DeptDAO {

    @Autowired
    DeptMapper deptMapper;

    public List<Dept> findAll() {
        return deptMapper.findAll();
    }

    public Dept findOne(String dept_id) {
        return deptMapper.findOne(dept_id);
    }

    public int add(Dept dept) {
        return deptMapper.add(dept);
    }

    public int delete(String id) {
        return deptMapper.delete(id);
    }

    public int update(Dept dept) {
        return deptMapper.update(dept);
    }

}
