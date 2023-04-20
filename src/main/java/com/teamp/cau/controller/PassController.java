package com.teamp.cau.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.groovy.runtime.metaclass.NewStaticMetaMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.dto.PassDTO;
import com.teamp.cau.service.PassService;
@Controller
public class PassController {
	
	@Autowired
	private PassService passService;
	
	
	@GetMapping("/pass")
	public ModelAndView Passed() {
		List<PassDTO> list_d = passService.departmentList();
		List<PassDTO> list_c = passService.categoryList();
		ModelAndView mv = new ModelAndView("pass");
		mv.addObject("list_d", list_d);
		mv.addObject("list_c", list_c);
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/passInfo")
	public List<PassDTO> Pass(@RequestParam(value = "KORN_FLNM", required = false) String KORN_FLNM ,@RequestParam(value = "department", required = false) String department,@RequestParam(value = "category", required = false) String category) {
		PassDTO passDTO = new PassDTO();
		passDTO.setDepartment(department);
		passDTO.setCategory(category);
		passDTO.setKORN_FLNM(KORN_FLNM);
		List<PassDTO> list = passService.studentList(passDTO);
		return list;
	}
		
	@GetMapping("/viewPDF")
	public ModelAndView viewPDF(HttpServletRequest request) {
		String PDF=request.getParameter("PDF");
		ModelAndView mv = new ModelAndView("viewPDF");
		PassDTO detail = passService.detail(PDF);
		mv.addObject("detail", detail);
		return mv;
	}
	@ResponseBody
	@PostMapping("/passUpdate")
	public String passUpdate(@RequestParam("stud_NO") int a,@RequestParam("PASS_INFO") int b) {
		PassDTO passDTO = new PassDTO();
		passDTO.setSTUD_NO(a);
		passDTO.setPASS_INFO(b);
		passService.passUpdate(passDTO);
		int result=passService.result(passDTO);
		return String.valueOf(result);
	}
}
