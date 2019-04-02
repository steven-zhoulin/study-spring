package com.steven.bookstore.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.steven.bookstore.mapper.BookMapper;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.beans.PropertyVetoException;

@Configuration
@PropertySource("classpath:db.properties")
@EnableTransactionManagement
@ComponentScan(basePackages = {"com.steven.bookstore"}, excludeFilters = {
        @Filter(type = FilterType.ANNOTATION, value = EnableWebMvc.class)
})
public class RootConfig {

    @Autowired
    Environment env;

    @Value("${jdbc.driver}")
    private String driver;

    @Value("${jdbc.url}")
    private String url;

    @Value("${jdbc.uid}")
    private String uid;

    @Value("${jdbc.pwd}")
    private String pwd;

    /**
     * 数据源
     * @return
     */
    @Bean
    public ComboPooledDataSource dataSource() throws PropertyVetoException {
        ComboPooledDataSource ds = new ComboPooledDataSource();
        ds.setDriverClass(driver);
        ds.setJdbcUrl(url);
        ds.setUser(uid);
        ds.setPassword(pwd);

        System.out.println(env.getProperty("jdbc.uid"));
        System.out.println(pwd);

        ds.setInitialPoolSize(5);
        ds.setMaxIdleTime(10);
        ds.setMaxPoolSize(15);
        return ds;
    }

    @Bean
    DataSourceTransactionManager DataSourceTransactionManager(ComboPooledDataSource dataSource) {
        DataSourceTransactionManager dstm = new DataSourceTransactionManager();
        dstm.setDataSource(dataSource);

        return dstm;
    }

    @Bean
    JdbcTemplate jdbcTemplate (ComboPooledDataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        return jdbcTemplate;
    }

    /**
     * SqlSessionFactoryBean配置
     * @param dataSource
     * @return
     */
    @Bean
    SqlSessionFactoryBean sqlSessionFactoryBean(ComboPooledDataSource dataSource) {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration() ;
        sqlSessionFactoryBean.setConfiguration(configuration);
        return sqlSessionFactoryBean;
    }

    @Bean
    MapperFactoryBean<BookMapper> mapperFactoryBean(SqlSessionFactoryBean sqlSessionFactoryBean) throws Exception {
        MapperFactoryBean<BookMapper> mapperFactoryBean = new MapperFactoryBean<BookMapper>();

        mapperFactoryBean.setSqlSessionFactory(sqlSessionFactoryBean.getObject());
        mapperFactoryBean.setMapperInterface(BookMapper.class);

        return mapperFactoryBean;
    }


}
