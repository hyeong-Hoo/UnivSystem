package com.teamp.cau.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.teamp.cau.dto.ScheduleDTO;
import com.teamp.cau.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/schedule")
	public String Schedule() {
		return "schedule";
	}
	
	@GetMapping("/sch")
	public List<ScheduleDTO> schtable(){
		List<ScheduleDTO> list = scheduleService.tableList();
		
		return list;
	}
}
