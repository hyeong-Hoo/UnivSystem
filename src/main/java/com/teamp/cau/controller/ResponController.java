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
			result="/hello";
		}else if(test2 == 2) {
			result="/testfile";
		}else if(test2 == 3) {
			result="/testfile2";
		}else if(test2 == 4) {
			result="/grid";
		}else if(test2 == 10) {
			result="/recruit";
		}else if(test2 == 11) {
			result="/schedule";
		}else if(test2 == 12) {
			result="/pass";
		}
		return result;
	}
}
