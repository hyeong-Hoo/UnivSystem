package com.teamp.cau.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResponController {
	
	//메뉴 추가 및 div 불러오기
	/*
	 * ID 1번대  :   관리자 관리    
	 * ID 2번대  :   학생 관리    
	 * ID 3번대  :   학생메뉴   
	 * ID 4번대  :   교수메뉴  
	 * ID 5번대  :   입시관리    
	 * ID 5번대  :   교직관리
	 */
	@PostMapping("/tester")
	public String tester(@RequestParam("id") String test2 ) {
		String result = null;
		if(test2.equals("2-1")) { //1차필터
		    result="/student";
		} else if(test2.equals("2-2")) { //합격관리
		    result="/pass";
		} else if(test2.equals("2-3")) { //입학정원관리
		    result="/get_stud";
		} else if(test2.equals("2-4")) { //개인신상조회
		    result="/grid";
		} else if(test2.equals("3-1")) { //학생 - 개인정보 조회 및 수정
		    result="/stuinfo";
		}  else if(test2.equals("3-4")) { //학생 - 비밀번호변경
		    result="/update";
		} else if(test2.equals("5-1")) { //수시 지원자 관리
		    result="/occasional";
		} else if(test2.equals("5-2")) { //정시 지원자 관리
		    result="/assessment";
		} else if(test2.equals("5-3")) { //모집요강
		    result="/schedule";
		} else if(test2.equals("20")) { //결제시스템
		    result="/payment";
		}

		return result;
	}
}
