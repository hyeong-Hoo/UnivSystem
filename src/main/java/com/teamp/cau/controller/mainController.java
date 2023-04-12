package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {

	@GetMapping("/main")
	public String mainpage() {
		
		return "main";

	}
	
	@GetMapping("/buttons")
	public String test() {
		
		return "buttons";
	}
	
	@GetMapping("/index")
	public String index() {
		 
		return "index";
	}
	
	@GetMapping("/tables")
	public String tables() {
		 
		return "tables";
	}
}

