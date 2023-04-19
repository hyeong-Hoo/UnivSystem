package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class commonController {

	@GetMapping("/index")
	public String index() {
		return "index";
	}

	@GetMapping("/com_department")
	public String department() {
		return "com_department";
	}

	
	
}
