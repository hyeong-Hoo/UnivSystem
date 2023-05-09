package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StuIndiController {

	@GetMapping("/stuinfo")
	public String stuinfo() {
		return "stuinfo";
	}

	
	
	
	@GetMapping("/stupasschange")
	public String stupasschange() {
		return "stupasschange";
	}
}