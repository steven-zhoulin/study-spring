package com.steven.demo.system.mapper;

import com.steven.demo.system.domain.Menu;
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
public interface MenuMapper {

    @Select("select id, create_time, i_frame, name, component, pid, icon, path from menu")
    List<Menu> getAllMenus();

    @Insert("insert into menu(i_frame, name, component, pid, icon, path) values(#{i_frame}, #{name}, #{component}, #{pid}, #{icon}, #{path})")
    public int add(Menu menu);

    @Delete("delete from menu where id = #{id}")
    public int delete(String id);

    @Update("update menu set i_frame=#{i_frame}, name=#{name}, component=#{component}, pid=#{pid}, icon=#{icon}, path=#{path} where id=#{id}")
    public int update(Menu menu);

}
