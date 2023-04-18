package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class registerController {

	@GetMapping("/regi_standard")
	public String standard() {
		return "regi_standard";
	}
	
	@GetMapping("/regi_regi_cost")
	public String cost() {
		return "regi_cost";
	}
	
	@GetMapping("/regi_costall")
	public String costall() {
		return "regi_costall";
	}
}
