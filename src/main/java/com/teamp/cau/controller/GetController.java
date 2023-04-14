package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GetController {
	
	@GetMapping("/hello")
	public String hello(){
		
		return "hello";
	}
	@GetMapping("/testfile")
	public String testfile() {
		
		return "testfile";
	}
	
	@GetMapping("/testfile2")
	public String testfile2() {
		
		return "testfile2";
	}
	//모집요강
	@GetMapping("/recruit")
	public String recruit() {
		
		return "recruit";
		
	}
}
