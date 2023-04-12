package com.teamp.cau.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.teamp.cau.dto.AssessmentDTO;
import com.teamp.cau.service.AssessmentService;

@Controller

public class AssessmentController {
	@Autowired
	private AssessmentService assessmentService;
	
	
	
	@GetMapping("/assessment")
	public String assessment() {
		return "assessment";
	}
		
	@GetMapping("/asm")
	public String asm() {
		
		List<AssessmentDTO> asmList = assessmentService.asmList();
		
		return "asmList";
	}

}
