package com.steven.demo.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private static final Logger LOG = LoggerFactory.getLogger(SecurityConfig.class);

    private static final String SQL_USERS_BY_USERNAME_QUERY =
            "SELECT username, password, enabled FROM sys_users WHERE username = ?";

    private static final String SQL_AUTHORITIES_BY_USERNAME_QUERY =
            "SELECT username, authority FROM sys_user_authorities WHERE username = ?";

    private static final String SQL_GROUP_AUTHORITIES_BY_USERNAME_QUERY =
            "SELECT role.id, role.rolename, ra.authority \n" +
                    "  FROM sys_roles role, sys_role_users ru, sys_role_authorities ra \n" +
                    " WHERE ru.username = ? \n" +
                    "   AND role.id = ra.role_id \n" +
                    "   AND role.id = ru.role_id";

    @Autowired
    DataSource dataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        // 1.基于内存的用户存储 (主要用于开发和测试)
        // auth.inMemoryAuthentication().withUser("user").password("123456").roles("USER");
        // auth.inMemoryAuthentication().withUser("admin").password("admin123").roles("USER", "ADMIN");

        // 2.基于数据库的用户存储 (用于生产环境)
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery(SQL_USERS_BY_USERNAME_QUERY)
                .authoritiesByUsernameQuery(SQL_AUTHORITIES_BY_USERNAME_QUERY)
                .groupAuthoritiesByUsername(SQL_GROUP_AUTHORITIES_BY_USERNAME_QUERY)
                .passwordEncoder(new BCryptPasswordEncoder());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/static/**");
        web.ignoring().antMatchers("/images/**");
        web.ignoring().antMatchers("/plugins/**");
        web.ignoring().antMatchers("/styles/**");

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests().anyRequest().permitAll();
//        http.authorizeRequests().anyRequest().authenticated().and().formLogin().usernameParameter("admin").passwordParameter("admin").and().httpBasic();
        http.headers().frameOptions().disable();
    }

}
