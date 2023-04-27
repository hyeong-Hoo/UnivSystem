package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class entranceController {

	@GetMapping("/ent_standard")
	public String standard() {
		
		return "ent_standard";
	}

}
