package com.teamp.cau.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		List<Map<String, Object>> year = recruitService.year();
		List<RecruitDTO> depart = recruitService.depart();
		mv.addObject("year", year);
		mv.addObject("depart", depart);
		return mv;
	}

	@GetMapping("/check")
	@ResponseBody
	public List<Map<String, Object>> check(@RequestParam("year") String year, @RequestParam("depart") String depart) {
		RecruitDTO dto = new RecruitDTO();
		dto.setYEAR(year);
		dto.setDEPARTMENT(depart);
		List<Map<String, Object>> data = recruitService.check(dto);
//		for (int i = 0; i < data.size(); i++) {
//			data.get(i).put("가나다라", 0);
//		}
		System.out.println(data);
		return data;
	}
}
