package com.bus.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bus.bean.Busbaseinfo;
import com.bus.bean.Busdriver;
import com.bus.bean.Businfo;
import com.bus.bean.Cityspot;
import com.bus.mybatis.dao.BusinfoDao;
import com.bus.service.inter.BusinfoService;

@Service
public class BusinfoServiceImpl implements BusinfoService {

	@Autowired
	private BusinfoDao businfoDao;

	@Override
	public int saveBusinfo(Busbaseinfo busbaseinfo) {
		if (busbaseinfo.getTime() != null && !"".equals(busbaseinfo.getTime())) {
			busbaseinfo.setBegtime(busbaseinfo.getTime().split("-")[0].trim());
			busbaseinfo.setEndtime(busbaseinfo.getTime().split("-")[1].trim());
		}
		businfoDao.savebase(busbaseinfo);

		Busbaseinfo b = businfoDao.queryBusByName(busbaseinfo.getBusname());

		for (int i = 0; i < busbaseinfo.getSpot().size(); i++) {
			Businfo businfo = new Businfo();
			businfo.setId(b.getId());
			businfo.setInd(String.valueOf(i));
			businfo.setSpot(busbaseinfo.getSpot().get(i));
			businfoDao.save(businfo);
		}
		return 1;
	}

	@Override
	public List<Businfo> queryBySpot(String spot) {
		return businfoDao.queryBySpot(spot);
	}

	@Override
	public int delete(String id) {
		businfoDao.delete(id);
		businfoDao.deleteDriver(id);
		return businfoDao.deletebase(id);
	}

	@Override
	public List<Busbaseinfo> queryBusname(String busname, String spot) {
		return businfoDao.queryBuses(busname, spot);
	}

	@Override
	public Busbaseinfo queryBusbaseinfo(String id) {
		Busbaseinfo busbaseinfo = businfoDao.queryBus(id);
		List<Businfo> businfo = businfoDao.query(id);
		List<String> tmpList = new ArrayList<>();
		busbaseinfo.setSpot(tmpList);
		for (Businfo businfo2 : businfo) {
			tmpList.add(businfo2.getSpot());
		}
		busbaseinfo.setTime(busbaseinfo.getBegtime() + " - " + busbaseinfo.getEndtime());
		return busbaseinfo;
	}

	@Override
	public int update(Busbaseinfo busbaseinfo) {
		if (busbaseinfo.getTime() != null && !"".equals(busbaseinfo.getTime())) {
			busbaseinfo.setBegtime(busbaseinfo.getTime().split("-")[0].trim());
			busbaseinfo.setEndtime(busbaseinfo.getTime().split("-")[1].trim());
		}
		businfoDao.update(busbaseinfo);
		businfoDao.delete(busbaseinfo.getId());

		for (int i = 0; i < busbaseinfo.getSpot().size(); i++) {
			Businfo businfo = new Businfo();
			businfo.setId(busbaseinfo.getId());
			businfo.setInd(String.valueOf(i));
			businfo.setSpot(busbaseinfo.getSpot().get(i));
			businfoDao.save(businfo);
		}
		return 1;
	}

	@Override
	public Busbaseinfo queryBusbaseinfoByname(String busname) {
		return businfoDao.queryBusByName(busname);
	}

	@Override
	public List<Busdriver> queryDriverList(String busid) {
		return businfoDao.selectDriver(busid);
	}

	@Override
	public int updateDrivers(Busbaseinfo busbaseinfo) {
		businfoDao.deleteDriver(busbaseinfo.getId());
		for (int i = 0; i < busbaseinfo.getDrivername().size(); i++) {
			Busdriver busdriver = new Busdriver();
			busdriver.setBusid(busbaseinfo.getId());
			busdriver.setDrivername(busbaseinfo.getDrivername().get(i));
			busdriver.setDriverid(busbaseinfo.getDriverid().get(i));
			businfoDao.saveDriver(busdriver);
		}
		return 1;
	}

	@Override
	public List<Cityspot> queryCitys() {
		return businfoDao.queryCitypot();
	}
}
