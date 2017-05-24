package com.kosta.th147_4group.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class IndexController {
	
	@RequestMapping("/loginMain.do")
	public String index()
	{
		System.out.println("index.htm 실행");
		return "login/loginMain";
	}
	
	@RequestMapping("/main.do")
	public String main()
	{
		System.out.println("main.do 실행");
		return "/main";
	}
	
}
