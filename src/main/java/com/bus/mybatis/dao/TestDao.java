package com.bus.mybatis.dao;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface TestDao {
	
	@Select("select count(1) from userinfo")
	public int cntTest();
}
