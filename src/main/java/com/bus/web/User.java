package com.bus.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.bus.bean.UserInfo;
import com.bus.bean.Userdetail;
import com.bus.service.inter.UserinfoService;

@Controller
@RequestMapping("/user")
@SessionAttributes({ "userinfo" })
public class User {

	@Autowired
	private UserinfoService userinfoService;

	@RequestMapping("/register")
	@ResponseBody
	public int register(@ModelAttribute UserInfo userinfo) {
		try {
			return userinfoService.register(userinfo);
		} catch (Exception e) {
			return -1;
		}
	}

	@RequestMapping("/getUser")
	@ResponseBody
	public UserInfo getUser(String username) {
		return userinfoService.getUserInfo(username);
	}

	@RequestMapping("/login")
	@ResponseBody
	public String login(@ModelAttribute UserInfo userinfo) {
		return userinfoService.login(userinfo);
	}

	@RequestMapping("/logout")
	public String logout() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		request.getSession().removeAttribute("userinfo");
		return "redirect:/pages/login/login.jsp";
	}

	@RequestMapping("/index")
	public String index(@ModelAttribute UserInfo userinfo, Model model) {
		String valInfo = login(userinfo);
		if (valInfo != null && !"".equals(valInfo)) {
			return "redirect:/pages/login/login.jsp";
		}

		model.addAttribute("userinfo", userinfoService.getUserInfo(userinfo.getUsername()));

		return "redirect:/pages/mfan/admin/index/index.jsp";
	}

	@RequestMapping("/userdetail")
	public String userdetail(Model model) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		UserInfo userinfo = (UserInfo) request.getSession().getAttribute("userinfo");
		model.addAttribute("userdetail", userinfoService.getUserdetail(userinfo.getUsername()));
		return "index/userDetail";
	}

	@RequestMapping("/userdetailmodify")
	public String userdetailmodify(Model model) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		UserInfo userinfo = (UserInfo) request.getSession().getAttribute("userinfo");
		model.addAttribute("userdetail", userinfoService.getUserdetail(userinfo.getUsername()));

		return "index/userDetail_modify";
	}

	@RequestMapping("/saveUserdetail")
	public String saveUserdetail(@ModelAttribute Userdetail userdetail) {
		userinfoService.saveUserdetail(userdetail);
		return "redirect:/user/userdetail";
	}

	@RequestMapping("/check")
	@ResponseBody
	public String check() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		if (request.getSession().getAttribute("userinfo") == null) {
			return "-1";
		}
		return "1";
	}
}
