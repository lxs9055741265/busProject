package com.bus.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bus.service.inter.TestDaoService;

@RestController
public class Test {

	@RequestMapping("/test")
	public String test() {
		return "hello world!";
	}
	
	@Autowired
	private TestDaoService testDaoService;

	@RequestMapping("/testDb")
	public String testDb() {
		return String.valueOf(testDaoService.cntTest());
	}
}
