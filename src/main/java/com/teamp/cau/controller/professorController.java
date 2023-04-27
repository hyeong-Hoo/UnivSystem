package com.teamp.cau.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.dto.professorDTO;
import com.teamp.cau.service.professorService;

@Controller
public class professorController {
	
	@Autowired
	private professorService prService;

	@GetMapping("/pr_standard")
	public String standard() {
		
		return "pr_standard";
	}
	
	@GetMapping("/pr_info")
	public ModelAndView prinfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("pr_info");
		List<professorDTO> list = prService.prinfo();
		mv.addObject("list", list);
		return mv;
	}
	
	@PostMapping("/pr_info")
	public ModelAndView search(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("pr_info");
		HashMap<String, Object> search = new HashMap<>();
		String name_search = request.getParameter("name_search");
		String code_search = request.getParameter("code_search");
		System.out.println(name_search);
		System.out.println(code_search);
		HashMap<String,String> map=new HashMap<>();
		map.put("name_search", name_search);
		map.put("code_search", code_search);
		List<professorDTO> list = prService.selectList(map);
		mv.addObject("list", list);
		return mv;
	}
	
	@GetMapping("/pr_authority")
	public String give_auth() {
		
		return "pr_authority";
	}
	
}
