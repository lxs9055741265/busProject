package com.bus.service.inter;

import java.util.List;

import com.bus.bean.Busbaseinfo;
import com.bus.bean.Busdriver;
import com.bus.bean.Businfo;
import com.bus.bean.Cityspot;

public interface BusinfoService {

	public int saveBusinfo(Busbaseinfo businfoBean);

	public List<Businfo> queryBySpot(String spot);
	
	public int delete(String id);
	
	public int update(Busbaseinfo busbaseinfo);

	public List<Busbaseinfo> queryBusname(String busname, String spot);

	public Busbaseinfo queryBusbaseinfo(String id);
	
	public Busbaseinfo queryBusbaseinfoByname(String busname);

	List<Busdriver> queryDriverList(String busid);

	public int updateDrivers(Busbaseinfo busbaseinfo);
	
	public List<Cityspot> queryCitys();
}
