package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class helloController {
	
	@GetMapping("/hello")
	public String hello(){
		
		return "hello";
	}
}