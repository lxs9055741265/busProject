package com.bus.service.inter;

import java.util.List;

import com.bus.bean.Lostinfo;

public interface LostinfoService {
	
	public int saveLostinfo(Lostinfo lostinfo);

	public List<Lostinfo> queryLostinfo(Lostinfo lostinfo);

	public int deleteLostinfo(String id);
	
	public int recLost(String id);
}
