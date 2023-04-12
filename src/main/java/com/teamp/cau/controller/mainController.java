package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@PostMapping("/test")
	@ResponseBody
	public String test() {
		
		
	}
}

