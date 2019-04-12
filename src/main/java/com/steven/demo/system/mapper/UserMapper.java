package com.steven.demo.system.mapper;

import com.steven.demo.system.domain.Dept;
import com.steven.demo.system.domain.Job;
import com.steven.demo.system.domain.User;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author steven.zhou
 */
@Repository
public interface UserMapper {

    @Select("select id, avatar, create_time, email, enabled, password, username, phone, dept_id, job_id from user")
    List<User> findAll();

    @Select("select id, avatar, create_time, email, enabled, password, username, phone, dept_id, job_id from user where id = #{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "dept", column = "dept_id", javaType = Dept.class, one = @One(select = "com.steven.demo.system.mapper.DeptMapper.findOne")),
            @Result(property = "job", column = "job_id", javaType = Job.class, one = @One(select = "com.steven.demo.system.mapper.JobMapper.findOne")),
    })
    User findOne(String id);

    @Insert("insert into user(username, password, phone, email, dept_id, job_id, create_time, enabled) " +
            "values(#{username}, #{password}, #{phone}, #{email}, #{dept_id}, #{job_id}, now(), #{enabled})")
    public int add(User user);

    @Delete("delete from user where id = #{id}")
    public int delete(String id);

    @Update("update user set phone=#{phone}, email=#{email}, password=#{password}, dept_id=#{dept_id}, " +
            "job_id=#{job_id}, enabled=#{enabled} " +
            "where id=#{id}")
    public int update(User user);

}
