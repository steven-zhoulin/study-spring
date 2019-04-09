package com.steven.devops.entities;


import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 主机实体
 */
@Setter
@Getter
public class Host {

    /**
     * 编号
     */
    private int id;

    /**
     * 主机IP
     */
    private String hostIp;

    /**
     * CPU使用率
     */
    private double cpuUsage;

    /**
     * 套接字使用率
     */
    private double socketUsage;

    /**
     * 磁盘使用率
     */
    private double diskUsage;

    public Host() {
    }

    public Host(int id, String hostIp, double cpuUsage, double socketUsage, double diskUsage) {
        this.id = id;
        this.hostIp = hostIp;
        this.cpuUsage = cpuUsage;
        this.socketUsage = socketUsage;
        this.diskUsage = diskUsage;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
