package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class helloController {
	
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
	
	@PostMapping("/tester")
	@ResponseBody
	public String tester(@RequestParam("id") int test2 ) {
		String result = null;
		if(test2 == 1) {
			result="/hello";
		}else if(test2 == 2) {
			result="/testfile";
		}else if(test2 == 3) {
			result="/testfile2";
		}
		return result;
	}
}