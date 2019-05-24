package com.bus.service.inter;

import java.util.List;

import com.bus.bean.Viewinfo;

public interface ViewinfoService {

	int saveViewinfo(Viewinfo viewinfo);

	int deleteViewinfo(String viewid);

	List<Viewinfo> queryBytitle(String viewtitle);

	Viewinfo queryViewById(String viewid);
}
