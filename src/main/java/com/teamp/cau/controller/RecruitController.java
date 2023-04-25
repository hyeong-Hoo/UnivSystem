package com.teamp.cau.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.teamp.cau.dto.RecruitDTO;
import com.teamp.cau.service.RecruitService;

@Controller
public class RecruitController {
	
	@Autowired
	private RecruitService recruitService;
	
	@GetMapping("/recruit")
	public String recruit() {
		List<RecruitDTO> list = recruitService.selectList();
		return "recruit";
		
	}
}
