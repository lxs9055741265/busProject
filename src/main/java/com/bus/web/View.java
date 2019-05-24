package com.bus.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bus.bean.Viewinfo;
import com.bus.service.inter.ViewinfoService;

@Controller
@RequestMapping("/view")
public class View {

	@Autowired
	private ViewinfoService viewinfoService;

	@RequestMapping("/save")
	public String save(@ModelAttribute Viewinfo viewinfo) {
		viewinfoService.saveViewinfo(viewinfo);
		return "redirect:/pages/view/view_manage.jsp";
	}

	@RequestMapping("/delete/{viewid}")
	public String delete(@PathVariable("viewid") String viewid) {
		viewinfoService.deleteViewinfo(viewid);
		return "redirect:/pages/view/view_manage.jsp";
	}

	@RequestMapping("query")
	@ResponseBody
	public List<Viewinfo> query(String viewname) {
		return viewinfoService.queryBytitle(viewname);
	}
}
