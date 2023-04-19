package com.teamp.cau.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		public String pass(){
			return "pass";
		}
	
	@ResponseBody
	@GetMapping("/passInfo")
	public List<PassDTO> Pass(@RequestParam(value = "KORN_FLNM", required = false) String KORN_FLNM) {
		List<PassDTO> list = passService.studentList(KORN_FLNM);
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
