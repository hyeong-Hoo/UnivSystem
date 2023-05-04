package com.teamp.cau.controller;

import java.util.HashMap;
import java.util.Map;

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
	
	@GetMapping("/grid")
	public String grid() {
		return "grid";
	}
}
