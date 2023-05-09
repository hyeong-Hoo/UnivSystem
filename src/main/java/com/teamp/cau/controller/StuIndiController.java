package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StuIndiController {

	@GetMapping("/student/stuinfo")
	public String stuinfo() {
		return "/student/stuinfo";
	}

	
	
}