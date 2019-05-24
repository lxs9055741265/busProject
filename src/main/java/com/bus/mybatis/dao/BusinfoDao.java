package com.bus.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;

import com.bus.bean.Busbaseinfo;
import com.bus.bean.Busdriver;
import com.bus.bean.Businfo;
import com.bus.bean.Cityspot;

@MapperScan
public interface BusinfoDao {

	@Insert("insert into businfo (id,ind,spot) values(#{id},#{ind},#{spot})")
	public int save(Businfo businfo);

	@Insert("insert into busbaseinfo (busname,money,begtime,endtime) values(#{busname},#{money},#{begtime},#{endtime})")
	public int savebase(Busbaseinfo businfoBean);

	@Update("update busbaseinfo set busname=#{busname},money=#{money},begtime=#{begtime},endtime=#{endtime} where id=#{id}")
	public int update(Busbaseinfo businfoBean);

	@Select("select * from businfo where id=#{id}")
	public List<Businfo> query(String id);

	@Select("select * from businfo where spot=#{spot}")
	public List<Businfo> queryBySpot(String spot);

	@Delete("delete from businfo where id=#{id}")
	public int delete(String id);

	@Delete("delete from busbaseinfo where id=#{id}")
	public int deletebase(String id);

	@Select("select * from busbaseinfo where id in (select id from businfo where spot like '%${spot}%' and busname like '%${busname}%')")
	public List<Busbaseinfo> queryBuses(@Param("busname") String busname, @Param("spot") String spot);

	@Select("select * from busbaseinfo where id = #{id}")
	public Busbaseinfo queryBus(@Param("id") String id);

	@Select("select * from busbaseinfo where busname = #{busname}")
	public Busbaseinfo queryBusByName(@Param("busname") String busname);

	@Insert("insert into busdriver (busid,drivername,driverid) values (#{busid},#{drivername},#{driverid})")
	public int saveDriver(Busdriver busdriver);

	@Select("select * from busdriver where busid=#{busid}")
	public List<Busdriver> selectDriver(String busid);

	@Delete("delete from busdriver where busid=#{busid}")
	public int deleteDriver(String busid);
	
	@Select("select * from cityspot")
	public List<Cityspot> queryCitypot();
}
