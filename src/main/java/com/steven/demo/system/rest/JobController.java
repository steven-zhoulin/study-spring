package com.steven.demo.system.rest;

import com.steven.demo.system.domain.Job;
import com.steven.demo.system.service.DeptService;
import com.steven.demo.system.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/system/job")
public class JobController {

    @Autowired
    private JobService jobService;

    @RequestMapping(value = "/list")
    public List<Job> findAll() {
        List<Job> jobs = jobService.findAll();
        return jobs;
    }

    @RequestMapping(value = "/{id}")
    public Job findOne(@PathVariable("id") String id) {
        return jobService.findOne(id);
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public List<Job> findByDeptId(@RequestParam(value = "deptId", required = false) String deptId) {
        List<Job> jobs = jobService.findByDeptId(deptId);
        return jobs;
    }
}
