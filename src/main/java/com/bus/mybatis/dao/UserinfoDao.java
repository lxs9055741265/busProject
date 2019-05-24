package com.bus.mybatis.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import com.bus.bean.UserInfo;
import com.bus.bean.Userdetail;

@MapperScan
public interface UserinfoDao {
	@Insert("insert into userinfo (username,password,name) values(#{username},#{password},#{name})")
	public int save(UserInfo userinfo);
	
	@Select("select * from userinfo where username=#{username}")
	public UserInfo query(String username);
	
	@Insert("insert into userdetail (username,name,mail,sex,bthdate,pid,phone) values(#{username},#{name},#{mail},#{sex},#{bthdate},#{pid},#{phone})")
	public int saveUserdetail(Userdetail userdetail);
	
	@Insert("update userdetail set name=#{name},mail=#{mail},sex=#{sex},bthdate=#{bthdate},pid=#{pid},phone=#{phone} where username=#{username}")
	public int updateUserdetail(Userdetail userdetail);
	
	@Select("select * from userdetail where username=#{username}")
	public Userdetail queryUserdetail(String username);
}
