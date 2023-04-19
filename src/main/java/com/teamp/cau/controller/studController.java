package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class studController {

	@GetMapping("/stud_standard")
	public String standard() {
		
		return "stud_standard";
	}
	
	@GetMapping("/stud_record")
	public String record() {
		
		return "stud_record";
	}
	
	@GetMapping("/stud_admission")
	public String admission() {
		
		return "stud_admission";
	}
	
	@GetMapping("/stud_personal")
	public String personal() {
		
		return "stud_personal";
	}
}
