package com.teamp.cau.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.dto.RecruitDTO;
import com.teamp.cau.service.RecruitService;

@Controller
public class RecruitController {
	
	@Autowired
	private RecruitService recruitService;
	
	@GetMapping("/recruit")
	public ModelAndView recruit() {
		ModelAndView mv = new ModelAndView("recruit");
		List<RecruitDTO> year = recruitService.year();
		List<RecruitDTO> depart = recruitService.depart();
		mv.addObject("year",year);
		mv.addObject("depart",depart);
		return mv;
		
	}
}
