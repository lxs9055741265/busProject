package com.bus.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;

import com.bus.bean.Balance;
import com.bus.bean.Balancedetail;

@MapperScan
public interface AccountDao {

	@Insert("insert balance(username,money) values(#{username},#{money})")
	public int insertBalance(Balance balance);

	@Insert("insert balancedetail(username,money,acct,acctime,detail) values(#{username},#{money},#{acct},#{acctime},#{detail})")
	public int insertBalancedetail(Balancedetail balancedetail);

	@Update("update balance set money=#{money} where username=#{username}")
	public int updateBalance(Balance balance);

	@Select("select * from balance where username=#{username}")
	public Balance select(String username);

	@Select("select * from balancedetail where username=#{username}")
	public List<Balancedetail> selectBalancedetail(String username);
}
