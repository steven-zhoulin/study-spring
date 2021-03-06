package com.steven.demo.controller;

import com.steven.demo.entities.Host;
import com.steven.demo.service.HostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/host-rest")
public class HostRestController {

    @Autowired
    HostService hostservice;

    @ResponseBody
    @RequestMapping(value = "/list")
    public List<Host> restHome() {

        List<Host> hosts = hostservice.getAllHosts();
        return hosts;
    }

}
