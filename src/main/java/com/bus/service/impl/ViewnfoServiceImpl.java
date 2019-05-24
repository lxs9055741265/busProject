package com.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bus.bean.Viewinfo;
import com.bus.mybatis.dao.ViewinfoDao;
import com.bus.service.inter.ViewinfoService;

@Service
public class ViewnfoServiceImpl implements ViewinfoService {

	@Autowired
	private ViewinfoDao viewinfoDao;

	@Override
	public int saveViewinfo(Viewinfo viewinfo) {
		return viewinfoDao.saveViewinfo(viewinfo);
	}

	@Override
	public int deleteViewinfo(String viewid) {
		return viewinfoDao.deleteViewByid(viewid);
	}

	@Override
	public List<Viewinfo> queryBytitle(String viewtitle) {
		return viewinfoDao.queryView(viewtitle);
	}

	@Override
	public Viewinfo queryViewById(String viewid) {
		return viewinfoDao.queryViewByid(viewid);
	}
}









