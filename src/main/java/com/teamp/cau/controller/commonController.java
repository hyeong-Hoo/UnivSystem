package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class commonController {

	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/com_right")
	public String right() {
		return "com_right";
	}
	
	@GetMapping("/com_userinfo")
	public String userinfo() {
		return "com_userinfo";
	}
	
	@GetMapping("/com_department")
	public String department() {
		return "com_department";
	}
	
	@GetMapping("/com_pw")
	public String pw() {
		return "com_pw";
	}
	
	@GetMapping("/com_notice")
	public String notice() {
		return "com_notice";
	}
	
	
}
