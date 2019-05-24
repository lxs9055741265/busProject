package com.bus.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import com.bus.bean.Viewinfo;

@MapperScan
public interface ViewinfoDao {

	@Select("select * from viewinfo where viewname like '%${viewname}%'")
	public List<Viewinfo> queryView(@Param("viewname") String viewname);

	@Select("select * from viewinfo where viewid = #{viewid}")
	public Viewinfo queryViewByid(String viewid);

	@Delete("delete from viewinfo where viewid = #{viewid}")
	public int deleteViewByid(String viewid);

	@Insert("insert into viewinfo (viewname,content) values(#{viewname},#{content})")
	public int saveViewinfo(Viewinfo viewinfo);
}
