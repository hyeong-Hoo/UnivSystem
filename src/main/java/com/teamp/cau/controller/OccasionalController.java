package com.teamp.cau.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamp.cau.dto.StudentDTO;
import com.teamp.cau.service.OccasionalService;

@Controller

public class OccasionalController {
	@Autowired
	private OccasionalService occasionalService;
	
	
	
	@GetMapping("/occasional")
	public String occasional() {
		return "occasional";
	}
	
	@ResponseBody		
	@GetMapping("/ocs")
	public List<StudentDTO> ocs() {
		
		List<StudentDTO> data = occasionalService.data();
	    return data;
		
	}
	
	@ResponseBody
	@PostMapping("/saves")	
	public String saveAssessment(@RequestBody List<StudentDTO> assessments) {
		occasionalService.updateAssessment(assessments);
	    System.out.println(assessments);
	    return "success";
	}

	
	
	

}
