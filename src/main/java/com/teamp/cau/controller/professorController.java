package com.teamp.cau.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class professorController {
	
	@Autowired
	private SqlSession sqlsession;

	@GetMapping("/pr_standard")
	public String standard() {
		
		return "pr_standard";
	}
	
	@GetMapping("/pr_info")
	public String info() {
		
		return "pr_info";
	}
	
	@PostMapping("/pr_search")
	public ModelAndView search(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HashMap<String, Object> list = new HashMap<String, Object>();
		//List<HashMap<String, Object>> qrlist = sqlsession.selectList("INSTR_INFO.searchlist", list);
		String search = request.getParameter("search");
		
		
		return mv;
	}
	
	@GetMapping("/pr_authority")
	public String give_auth() {
		
		return "pr_authority";
	}
	
}
