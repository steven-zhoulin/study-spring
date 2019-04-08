package com.steven.bookstore.service;

import com.steven.bookstore.dao.HostDAO;
import com.steven.bookstore.entities.Host;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class HostService {

    @Autowired
    HostDAO hostDAO;

    public List<Host> getAllHosts() {
        List<Host> hosts = new ArrayList<>();

        for (int i = 0; i < 50; i++) {
            Host host = new Host(i, "192.168.0." + i,
                    ThreadLocalRandom.current().nextDouble(1),
                    ThreadLocalRandom.current().nextDouble(1),
                    ThreadLocalRandom.current().nextDouble(1));
            hosts.add(host);
        }

        return hosts;
    }


}
