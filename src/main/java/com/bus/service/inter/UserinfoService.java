package com.bus.service.inter;

import com.bus.bean.UserInfo;
import com.bus.bean.Userdetail;

public interface UserinfoService {

	public int register(UserInfo userinfo);

	public UserInfo getUserInfo(String username);

	public String login(UserInfo userinfo);
	
	public Userdetail getUserdetail(String username);

	public int saveUserdetail(Userdetail userdetail);
}
