package com.bus.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import com.bus.bean.Publicinfo;

@MapperScan
public interface PubinfoDao {

	@Insert("insert into publicinfo (id,username,title,content,pubtime) "
			+ "values(#{id},#{username},#{title},#{content},#{pubtime})")
	public int save(Publicinfo publicinfo);


	@Select("select * from publicinfo order by pubtime desc")
	public List<Publicinfo> query();
	
	@Delete("delete from publicinfo where id=#{id}")
	public int delete(String id);
}
