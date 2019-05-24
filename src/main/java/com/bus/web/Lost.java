package com.bus.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bus.bean.Lostinfo;
import com.bus.service.inter.LostinfoService;

@Controller
@RequestMapping("/lost")
public class Lost {

	@Autowired
	private LostinfoService lostinfoService;

	@RequestMapping("/save")
	public String save(@ModelAttribute Lostinfo lostinfo) {
		lostinfoService.saveLostinfo(lostinfo);
		return "redirect:/pages/lost/lost_query.jsp";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Lostinfo> query(@ModelAttribute Lostinfo lostinfo) {
		return lostinfoService.queryLostinfo(lostinfo);
	}

	@RequestMapping("/delete")
	public String delete(String id) {
		lostinfoService.deleteLostinfo(id);
		return "redirect:/pages/lost/lost_query.jsp";
	}

	@RequestMapping("/rec")
	public String rec(String id) {
		lostinfoService.recLost(id);
		return "redirect:/pages/lost/lost_rec.jsp";
	}
}
