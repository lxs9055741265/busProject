package com.bus.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.sqlite.date.DateFormatUtils;

import com.bus.bean.Lostinfo;
import com.bus.bean.Recinfo;
import com.bus.bean.UserInfo;
import com.bus.mybatis.dao.LostinfoDao;
import com.bus.service.inter.LostinfoService;

@Service
public class LostinfoServiceImpl implements LostinfoService {

	@Autowired
	private LostinfoDao lostinfoDao;

	@Override
	public int saveLostinfo(Lostinfo lostinfo) {
		lostinfo.setApptime(DateFormatUtils.format(new Date(), "yyyy/MM/dd"));
		lostinfo.setId(UUID.randomUUID().toString());
		return lostinfoDao.save(lostinfo);
	}

	@Override
	public List<Lostinfo> queryLostinfo(Lostinfo lostinfo) {
		return lostinfoDao.query(lostinfo);
	}

	@Override
	public int deleteLostinfo(String id) {
		return lostinfoDao.delete(id);
	}

	@Override
	public int recLost(String id) {
		Lostinfo lostinfo = new Lostinfo();
		lostinfo.setId(id);
		Lostinfo lostInfo = lostinfoDao.query(lostinfo).get(0);
		Recinfo recinfo = new Recinfo();
		recinfo.setDesc(lostInfo.getDesc());
		recinfo.setApptime(lostInfo.getApptime());
		recinfo.setId(lostInfo.getId());
		recinfo.setLosttime(lostInfo.getLosttime());
		recinfo.setLosttype(lostInfo.getLosttype());
		recinfo.setMail(lostInfo.getMail());
		recinfo.setPhone(lostInfo.getPhone());
		

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		UserInfo userinfo = (UserInfo) request.getSession().getAttribute("userinfo");
		recinfo.setRecusername(userinfo.getUsername());
		recinfo.setTitle(lostInfo.getTitle());
		recinfo.setUsername(lostInfo.getUsername());
		recinfo.setRectime(DateFormatUtils.format(new Date(), "yyyy/MM/dd"));
		
		lostinfoDao.saveRec(recinfo);
		
		lostinfoDao.delete(id);
		return 0;
	}

}
