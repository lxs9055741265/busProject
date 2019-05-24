package com.bus.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectProvider;
import org.mybatis.spring.annotation.MapperScan;

import com.bus.bean.Lostinfo;
import com.bus.bean.Recinfo;

@MapperScan
public interface LostinfoDao {

	@Insert("insert into lostinfo (id,username,losttype,title,`desc`,losttime,mail,phone,apptime) "
			+ "values(#{id},#{username},#{losttype},#{title},#{desc},#{losttime},#{mail},#{phone},#{apptime})")
	public int save(Lostinfo lostinfo);
	
	
	@Insert("insert into recinfo (id,username,losttype,title,`desc`,losttime,mail,phone,apptime,recusername,rectime) "
			+ "values(#{id},#{username},#{losttype},#{title},#{desc},#{losttime},#{mail},#{phone},#{apptime},#{recusername},#{rectime})")
	public int saveRec(Recinfo recinfo);

	@SelectProvider(type = LostinfoProvider.class, method = "select")
	public List<Lostinfo> query(Lostinfo lostinfo);

	@Delete("delete from lostinfo where id=#{id}")
	public int delete(String id);

}
