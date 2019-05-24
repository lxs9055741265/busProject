package com.bus.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sqlite.date.DateFormatUtils;

import com.bus.bean.Publicinfo;
import com.bus.mybatis.dao.PubinfoDao;
import com.bus.service.inter.PublicService;

@Service
public class PublicServiceImpl implements PublicService {
	
	@Autowired
	private PubinfoDao pubinfoDao;

	@Override
	public int addPublic(Publicinfo publicinfo) {
		publicinfo.setPubtime(DateFormatUtils.format(new Date(), "yyyy/MM/dd"));
		publicinfo.setId(UUID.randomUUID().toString());
		return pubinfoDao.save(publicinfo);
	}

	@Override
	public List<Publicinfo> query() {
		return pubinfoDao.query();
	}

	@Override
	public int delete(String id) {
		return pubinfoDao.delete(id);
	}
}
