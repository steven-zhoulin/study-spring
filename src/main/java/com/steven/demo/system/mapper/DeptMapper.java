package com.steven.demo.system.mapper;

import com.steven.demo.system.domain.Dept;
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
public interface DeptMapper {

    @Select("select id, name, pid, create_time, enabled from dept")
    List<Dept> findAll();

    @Select("select id, name, pid, create_time, enabled from dept where id = #{dept_id}")
    Dept findOne(String dept_id);

    @Insert("insert into dept(name, pid, create_time, enabled) values(#{name}, #{pid}, now(), #{enabled})")
    public int add(Dept dept);

    @Delete("delete from dept where id = #{id}")
    public int delete(String id);

    @Update("update dept set name=#{name}, pid=#{pid}, enabled=#{enabled} where id=#{id}")
    public int update(Dept dept);

}
