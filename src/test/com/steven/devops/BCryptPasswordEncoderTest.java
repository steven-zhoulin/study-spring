package com.steven.devops;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderTest {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println("admin: " + encoder.encode("admin"));
        System.out.println("guest: " + encoder.encode("guest"));
        System.out.println("zhoulin: " + encoder.encode("zhoulin"));
    }
}
