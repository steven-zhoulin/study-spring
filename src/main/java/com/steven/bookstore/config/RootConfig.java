package com.steven.bookstore.config;

import com.steven.bookstore.mapper.BookMapper;
import org.apache.commons.dbcp.BasicDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.sql.DataSource;

@Configuration
@PropertySource("classpath:db.properties")
@EnableTransactionManagement
@ComponentScan(basePackages = {"com.steven.bookstore"}, excludeFilters = {
        @Filter(type = FilterType.ANNOTATION, value = EnableWebMvc.class)
})
public class RootConfig {

    @Autowired
    Environment env;


    @Profile("development")
    @Bean
    public DataSource embeddedDataSource() {
        return new EmbeddedDatabaseBuilder()
                .setType(EmbeddedDatabaseType.H2)
                .setScriptEncoding("")
                .addScript("classpath:h2-schema.sql")
                .addScript("classpath:h2-test-data.sql")
                .build();
    }

    @Profile("production")
    @Bean
    public DataSource dataSource(@Value("${production.jdbc.driver}") String driver,
                                 @Value("${production.jdbc.url}") String url,
                                 @Value("${production.jdbc.username}") String username,
                                 @Value("${production.jdbc.password}") String password) {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName(driver);
        ds.setUrl(url);
        ds.setUsername(username);
        ds.setPassword(password);
        ds.setMaxActive(20);
        ds.setInitialSize(2);
        ds.setMaxWait(6000);
        ds.setMaxIdle(20);
        ds.setMinIdle(3);
        ds.setRemoveAbandoned(true);
        ds.setRemoveAbandonedTimeout(180);
        ds.setTestWhileIdle(true);
        ds.setValidationQuery("select 1");
        ds.setValidationQueryTimeout(1);
        ds.setTimeBetweenEvictionRunsMillis(30000);
        ds.setNumTestsPerEvictionRun(20);
        return ds;
    }

    @Bean
    DataSourceTransactionManager DataSourceTransactionManager(DataSource dataSource) {
        DataSourceTransactionManager dstm = new DataSourceTransactionManager();
        dstm.setDataSource(dataSource);
        return dstm;
    }

    @Bean
    JdbcTemplate jdbcTemplate (DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        return jdbcTemplate;
    }

    /**
     * SqlSessionFactoryBean配置
     *
     * @param dataSource
     * @return
     */
    @Bean
    SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource) {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration() ;
        sqlSessionFactoryBean.setConfiguration(configuration);
        return sqlSessionFactoryBean;
    }

    @Bean
    MapperFactoryBean<BookMapper> mapperFactoryBean(SqlSessionFactoryBean sqlSessionFactoryBean) throws Exception {
        MapperFactoryBean<BookMapper> mapperFactoryBean = new MapperFactoryBean<>();

        mapperFactoryBean.setSqlSessionFactory(sqlSessionFactoryBean.getObject());
        mapperFactoryBean.setMapperInterface(BookMapper.class);

        return mapperFactoryBean;
    }

}
