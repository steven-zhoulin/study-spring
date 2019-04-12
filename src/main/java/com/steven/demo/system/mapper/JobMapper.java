package com.steven.demo.system.mapper;

import com.steven.demo.system.domain.Dept;
import com.steven.demo.system.domain.Job;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author steven.zhou
 */
@Repository
public interface JobMapper {

    @Select("select id, name, enabled, create_time, sort, dept_id from job")
    List<Dept> findAll();

    @Select("select id, name, enabled, create_time, sort, dept_id from job where id = #{job_id}")
    Job findOne(String job_id);

    @Insert("insert into job(name, pid, create_time, enabled) values(#{name}, #{pid}, now(), #{enabled})")
    public int add(Job job);

    @Delete("delete from job where id = #{id}")
    public int delete(String id);

    @Update("update job set name=#{name}, pid=#{pid}, enabled=#{enabled} where id=#{id}")
    public int update(Job job);

}
