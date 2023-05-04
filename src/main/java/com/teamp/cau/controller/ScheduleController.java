package com.teamp.cau.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.dto.ScheduleDTO;
import com.teamp.cau.service.RecruitService;
import com.teamp.cau.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private RecruitService recruitService;
	
	@GetMapping("/schedule")
	public ModelAndView Schedule() {
		ModelAndView mv = new ModelAndView("schedule");
		
		mv.addObject("year", recruitService.year());
		return mv;
	}
	
	@GetMapping("/sch")
	@ResponseBody
	public List<Map<String, Object>> schtable(){
		List<Map<String, Object>> list = scheduleService.tableList();
		
		return list;
	}
	@GetMapping("/scheduleCheck")
	@ResponseBody
	public List<Map<String, Object>> scheduleCheck(@RequestParam("year") String year){
		ScheduleDTO dto = new ScheduleDTO();
		dto.setRECRT_YEAR(year);
		List<Map<String, Object>> list = scheduleService.scheduleCheck(dto);
		System.out.println(list);
		return list;
	}
}
