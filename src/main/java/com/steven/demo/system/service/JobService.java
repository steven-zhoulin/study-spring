package com.steven.demo.system.service;

import com.steven.demo.system.dao.JobDAO;
import com.steven.demo.system.domain.Job;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author steven.zhou
 */
@Service
public class JobService {

    @Autowired
    JobDAO jobDAO;

    public List<Job> findAll() {
        return jobDAO.findAll();
    }

    public Job findOne(String deptId) {
        return jobDAO.findOne(deptId);
    }

    public List<Job> findByDeptId(String deptId) {
        return jobDAO.findByDeptId(deptId);
    }

    public int add(Job job) {
        return jobDAO.add(job);
    }

    public int delete(String id) {
        return jobDAO.delete(id);
    }

    public int update(Job job) {
        return jobDAO.update(job);
    }

}
