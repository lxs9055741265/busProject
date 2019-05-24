package com.bus.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bus.bean.UserInfo;
import com.bus.bean.Userdetail;
import com.bus.mybatis.dao.UserinfoDao;
import com.bus.service.inter.UserinfoService;

@Service
public class UserinfoServiceImpl implements UserinfoService {

	@Autowired
	private UserinfoDao userinfoDao;

	@Override
	public int register(UserInfo userinfo) {
		return userinfoDao.save(userinfo);
	}

	@Override
	public UserInfo getUserInfo(String username) {
		return userinfoDao.query(username);
	}

	@Override
	public String login(UserInfo userinfo) {
		UserInfo u = userinfoDao.query(userinfo.getUsername());
		if (u == null) {
			return "用户名或者密码不正确";
		}
		if (!u.getPassword().equals(userinfo.getPassword())) {
			return "用户名或者密码不正确";
		}
		return "";
	}

	@Override
	public int saveUserdetail(Userdetail userdetail) {
		if (userinfoDao.queryUserdetail(userdetail.getUsername()) != null) {
			return userinfoDao.updateUserdetail(userdetail);
		} else {
			return userinfoDao.saveUserdetail(userdetail);
		}
	}

	@Override
	public Userdetail getUserdetail(String username) {
		return userinfoDao.queryUserdetail(username);
	}

}
