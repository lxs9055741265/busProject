package com.bus.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bus.bean.Publicinfo;
import com.bus.service.inter.PublicService;

@Controller
@RequestMapping("/public")
public class Public {

	@Autowired
	private PublicService publicService;

	@RequestMapping("/save")
	public String save(@ModelAttribute Publicinfo publicinfo) {
		publicService.addPublic(publicinfo);
		return "redirect:/pages/public/public_query.jsp";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Publicinfo> query() {
		return publicService.query();
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable String id) {
		publicService.delete(id);
		return "redirect:/pages/public/public_query.jsp";
	}
}
