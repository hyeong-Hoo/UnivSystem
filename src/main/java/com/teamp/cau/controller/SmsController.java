package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SmsController {

	
	@PostMapping("phoneAuth")
	@ResponseBody
	public Boolean phoneAuth(String tel) {

	    try { // 이미 가입된 전화번호가 있으면
	        if(memberService.memberTelCount(tel) > 0) 
	            return true; 
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    String code = memberService.sendRandomMessage(tel);
	    session.setAttribute("rand", code);
	    
	    return false;
	}

	@PostMapping("phoneAuthOk")
	@ResponseBody
	public Boolean phoneAuthOk() {
	    String rand = (String) session.getAttribute("rand");
	    String code = (String) request.getParameter("code");

	    System.out.println(rand + " : " + code);

	    if (rand.equals(code)) {
	        session.removeAttribute("rand");
	        return false;
	    } 

	    return true;
	}
}
