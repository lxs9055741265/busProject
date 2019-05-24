package com.bus.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.bus.bean.Balance;
import com.bus.bean.Balancedetail;
import com.bus.bean.UserInfo;
import com.bus.service.inter.BalanceService;

@Controller
@RequestMapping("/account")
public class Account {

	@RequestMapping("/next")
	public String next() {
		return "bus/add_account2";
	}

	@RequestMapping("/finish")
	public String finish() {
		return "bus/add_account3";
	}

	@Autowired
	private BalanceService balanceService;

	@RequestMapping("/submit")
	public String submit(String username, String money) {
		balanceService.addMoney(username, money, "用户充值");
		return "bus/add_account4";
	}
	
	@RequestMapping("/by")
	@ResponseBody
	public String by(String username, String money) {
		balanceService.addMoney(username, money, "乘车");
		return "bus/add_account4";
	}

	@RequestMapping("/queryDetail")
	@ResponseBody
	public List<Balancedetail> queryDetail() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		UserInfo userinfo = (UserInfo) request.getSession().getAttribute("userinfo");
		return balanceService.queryDetail(userinfo.getUsername());
	}
	
	@RequestMapping("/queryBalance")
	@ResponseBody
	public Balance queryBalance() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		UserInfo userinfo = (UserInfo) request.getSession().getAttribute("userinfo");
		return balanceService.queryBalance(userinfo.getUsername());
	}
}
