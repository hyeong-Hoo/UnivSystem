package com.teamp.cau.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamp.cau.dto.AssessmentDTO;
import com.teamp.cau.dto.StudentDTO;
import com.teamp.cau.service.AssessmentService;

@Controller

public class AssessmentController {
	@Autowired
	private AssessmentService assessmentService;
	
	
	
	@GetMapping("/assessment")
	public String assessment() {
		return "assessment";
	}
	
	@ResponseBody		
	@GetMapping("/asm")
	public List<StudentDTO> asm() {
		
		List<StudentDTO> data = assessmentService.data();
	    return data;
		
	}
	
	@ResponseBody
	@PostMapping("/save")	
	public String saveAssessment(@RequestBody List<StudentDTO> assessments) {
	    assessmentService.updateAssessment(assessments);
	    System.out.println(assessments);
	    return "success";
	}

	
	
	

}
