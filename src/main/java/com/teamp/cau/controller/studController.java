package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class studController {

	@GetMapping("/stud_admission")
	public String admission() {
		
		return "stud_admission";
	}

}
