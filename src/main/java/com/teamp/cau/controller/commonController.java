package com.teamp.cau.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.teamp.cau.security.CustomAuthenticationToken;
import com.teamp.cau.vo.UserVo;

@Controller
public class commonController {

	
		@GetMapping("/index")
		public String index(Authentication authentication,Model model) {
		if (authentication != null && authentication.isAuthenticated()) {
		UserVo userVo = ((CustomAuthenticationToken) authentication).getUserVo();
		if (userVo != null) {
			   String kornFlnm = userVo.getKORN_FLNM();
		Integer studNo = userVo.getSTUD_NO();
		Integer instrNo = userVo.getINSTR_NO();
		  System.err.println(userVo);
		    System.err.println(studNo);
		    System.err.println(instrNo);

            model.addAttribute("kornFlnm", kornFlnm);

		}
		}
		
		
		return "index";
	}

	@GetMapping("/com_department")
	public String department() {
		return "com_department";
	}

	
	
}
