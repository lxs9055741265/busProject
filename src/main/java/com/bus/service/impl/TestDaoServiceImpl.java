package com.bus.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bus.mybatis.dao.TestDao;
import com.bus.service.inter.TestDaoService;

@Service
public class TestDaoServiceImpl implements TestDaoService {

	@Autowired
	private TestDao testDao;
	
	public int cntTest() {
		return testDao.cntTest();
	}
}
