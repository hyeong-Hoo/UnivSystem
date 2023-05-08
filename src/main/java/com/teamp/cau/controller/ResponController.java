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
		if(test2 == 1) {
			result="/student";
		}else if(test2 == 2) {
			result="/pass";
		}else if(test2 == 3) {
			result="/get_stud";
		}else if(test2 == 4) {
			result="/grid";
		}else if(test2 == 10) {
			result="/occasional";
		}else if(test2 == 11) {
			result="/assessment";
		}else if(test2 == 12) {
			result="/pass";
		}else if(test2 == 20) {
			result="/payment";
		}else if(test2 == 5) {
			result="/passchange";
		}
		return result;
	}
}
