package com.teamp.cau.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResponController {
	
	//메뉴 추가 및 div 불러오기
	@PostMapping("/tester")
	public String tester(@RequestParam("id") int test2 ) {
		String result = null;
		if(test2 == 2-1) {
			result="/student";
		}else if(test2 == 2-2) {
			result="/pass";
		}else if(test2 == 2-3) {
			result="/get_stud";
		}else if(test2 == 2-4) {
			result="/grid";
		}else if(test2 == 5-1) {
			result="/occasional";
		}else if(test2 == 5-2) {
			result="/assessment";
		}else if(test2 == 5-3) {
			result="/pass";
		}else if(test2 == 20) {
			result="/payment";
		}else if(test2 == 5) {
			result="/passchange";
		}
		return result;
	}
}
