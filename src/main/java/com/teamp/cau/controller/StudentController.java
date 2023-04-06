package com.teamp.cau.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.dto.StudentDTO;
import com.teamp.cau.service.StudentService;


@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/student")
	public ModelAndView student() {
		
		ModelAndView mv = new ModelAndView("student");
		
		List<StudentDTO> studentList = studentService.studentList();
		
		mv.addObject("student", studentList);
		
		return mv;
	}

}
