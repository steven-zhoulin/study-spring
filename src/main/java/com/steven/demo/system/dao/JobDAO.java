package com.steven.demo.system.dao;

import com.steven.demo.system.domain.Dept;
import com.steven.demo.system.domain.Job;
import com.steven.demo.system.mapper.JobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author steven.zhou
 */
@Repository
public class JobDAO {

    @Autowired
    JobMapper jobMapper;

    public List<Job> findAll() {
        return jobMapper.findAll();
    }

    public Job findOne(String job_id) {
        return jobMapper.findOne(job_id);
    }

    public List<Job> findByDeptId(String deptId) {
        return jobMapper.findByDeptId(deptId);
    }

    public int add(Job job) {
        return jobMapper.add(job);
    }

    public int delete(String id) {
        return jobMapper.delete(id);
    }

    public int update(Job job) {
        return jobMapper.update(job);
    }

}