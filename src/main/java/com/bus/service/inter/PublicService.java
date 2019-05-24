package com.bus.service.inter;

import java.util.List;

import com.bus.bean.Publicinfo;

public interface PublicService {

	public int addPublic(Publicinfo publicinfo);
	
	public List<Publicinfo> query();
	
	public int delete(String id);
}
