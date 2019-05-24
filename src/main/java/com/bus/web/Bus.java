package com.bus.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bus.bean.Busbaseinfo;
import com.bus.bean.Busdriver;
import com.bus.bean.Cityspot;
import com.bus.service.inter.BusinfoService;

@Controller
@RequestMapping("/bus")
public class Bus {

	@Autowired
	private BusinfoService businfoService;

	@RequestMapping("/save")
	public String save(@ModelAttribute Busbaseinfo businfoBean) {
		businfoService.saveBusinfo(businfoBean);
		return "redirect:/pages/bus/bus_query.jsp";
	}

	@RequestMapping("/delete")
	public String delete(String id) {
		businfoService.delete(id);
		return "redirect:/pages/bus/bus_query.jsp";
	}

	@RequestMapping("/update")
	public String update(@ModelAttribute Busbaseinfo busbaseinfo) {
		businfoService.update(busbaseinfo);
		return "redirect:/pages/bus/bus_query.jsp";
	}

	@RequestMapping("/edit")
	public String edit(String id, Model model) {
		model.addAttribute("businfo", businfoService.queryBusbaseinfo(id));
		return "bus/bus_edit";
	}

	@RequestMapping("/show")
	public String show(String id, Model model) {
		model.addAttribute("businfo", businfoService.queryBusbaseinfo(id));
		return "bus/bus_detail";
	}

	@RequestMapping("/realtime")
	public String realtime(String id, Model model) {
		model.addAttribute("businfo", businfoService.queryBusbaseinfo(id));
		return "bus/bus_realtime";
	}

	@RequestMapping("/queryByName")
	@ResponseBody
	public List<Busbaseinfo> queryByName(String busname, String spot) {
		return businfoService.queryBusname(busname, spot);
	}

	@RequestMapping("/queryBaseByName")
	@ResponseBody
	public Busbaseinfo queryBaseByName(String busname) {
		return businfoService.queryBusbaseinfoByname(busname);
	}
	
	@RequestMapping("/updatedriver")
	public String updatedriver(@ModelAttribute Busbaseinfo busbaseinfo) {
		businfoService.updateDrivers(busbaseinfo);
		return "redirect:/pages/bus/bus_query.jsp";
	}

	@RequestMapping("/querydriver")
	@ResponseBody
	public List<Busdriver> querydriver(String busid) {
		return businfoService.queryDriverList(busid);
	}
	
	@RequestMapping("/dirver")
	public String dirver(String id, Model model) {
		model.addAttribute("driver", businfoService.queryDriverList(id));
		model.addAttribute("businfo", businfoService.queryBusbaseinfo(id));
		return "bus/bus_driver_edit";
	}
	
	@RequestMapping("/queryCity")
	@ResponseBody
	public List<Cityspot> queryCity() {
		return businfoService.queryCitys();
	}
}
