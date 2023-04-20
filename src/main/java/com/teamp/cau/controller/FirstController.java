package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FirstController {
	
	@GetMapping("/First") // 메인페이지
	public String First() {
		return "First";
	}
    
	
	@GetMapping("/First2") // 학교소개페이지
	public String First2() {
		return "First2";
	}
	@GetMapping("/First3") // 학사관리페이지
	public String First3() {
		return "First3";
	}
	
}