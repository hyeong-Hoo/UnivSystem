package com.teamp.cau.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamp.cau.dto.StudentDTO;
import com.teamp.cau.service.StudentService;


@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	
	@GetMapping("student")
	public String student(){
		return "student";
	}
	
	@ResponseBody
	@GetMapping("/info")
	public List<StudentDTO> student(@RequestParam("KORN_FLNM") String KORN_FLNM) {
		
		
		List<StudentDTO> studentList = studentService.studentList(KORN_FLNM);		
		System.out.println(studentList);	
		return studentList;
	}

}
