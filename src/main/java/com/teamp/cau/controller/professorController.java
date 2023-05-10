package com.teamp.cau.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.dto.professorDTO;
import com.teamp.cau.service.professorService;

@Controller
public class professorController {
	
	@Autowired
	private professorService prService;
	
	// 메인페이지 
	@GetMapping("/index")
	public String test() {
		return "index";
	}
	
	// 교수정보입력 페이지 
	@GetMapping("/professor")
	public String pro_write() {
		return "professor";
	}
	
	//교수정보입력 저장 
	@PostMapping("/professor_info")
	public String info_save(HttpServletRequest req) {
		String pr_id = req.getParameter("pr_id");
		String pr_pw = req.getParameter("pr_pw");
		String pr_no = req.getParameter("pr_no");
		String pr_dep = req.getParameter("pr_dep");
		String pr_name = req.getParameter("pr_name");
		String pr_telno = req.getParameter("pr_telno");
		String pr_birth = req.getParameter("pr_birth");
		String pr_email = req.getParameter("pr_email");
		Map<String, Object> infoEnter = new HashMap<>();
		infoEnter.put("pr_id", pr_id);
		infoEnter.put("pr_pw", pr_pw);
		infoEnter.put("pr_no", pr_no);
		infoEnter.put("pr_dep", pr_dep);
		infoEnter.put("pr_name", pr_name);
		infoEnter.put("pr_telno", pr_telno);
		infoEnter.put("pr_birth", pr_birth);
		infoEnter.put("pr_email", pr_email);
		System.out.println(infoEnter);
		Integer enter = prService.insert("prinfo_save", infoEnter);
		return "professor";
	}
	
	
	
	//교수본인정보 수정 불러오기 
	@GetMapping("/self_modify")
	public String modify( ) {
		
		return "self_modify";
	}
	
	//교수본인정보입력 저장 
	@PostMapping("/pr_self")
	public String self_save(HttpServletRequest req) {
		String pr_no = req.getParameter("pr_no");
		String name_kr = req.getParameter("name_kr");
		String name_en = req.getParameter("name_en");
		String roadAddrPart1 = req.getParameter("roadAddrPart1");
		String addrDetail = req.getParameter("addrDetail");
		String pr_telno = req.getParameter("pr_telno");
		String pr_email = req.getParameter("pr_email");
		String pr_birth = req.getParameter("pr_birth");
		String pr_gender = req.getParameter("pr_gender");
		Map<String, Object> selfmodi = new HashMap<>();
		selfmodi.put("pr_no", pr_no);
		selfmodi.put("name_kr", name_kr);
		selfmodi.put("name_en", name_en);
		selfmodi.put("roadAddrPart1", roadAddrPart1);
		selfmodi.put("addrDetail", addrDetail);
		selfmodi.put("pr_telno", pr_telno);
		selfmodi.put("pr_email", pr_email);
		selfmodi.put("pr_birth", pr_birth);
		selfmodi.put("pr_gender", pr_gender);
		System.out.println(selfmodi);
		Integer enter = prService.modify("selfSave", selfmodi);
		return "self_modify";
	}
	

	
	//교수정보 불러오기 
	@GetMapping("/pr_info")
	public ModelAndView prinfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("pr_info");
		List<professorDTO> list = prService.prinfo();
		mv.addObject("list", list);
		return mv;
	}
	
	//교수정보 검색 
	@PostMapping("/pr_info_search")
	public ModelAndView search(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("pr_info");
		HashMap<String, Object> search = new HashMap<>();
		String name_search = request.getParameter("name_search");
		String code_search = request.getParameter("code_search");
//		System.out.println(name_search);
//		System.out.println(code_search);
		HashMap<String,String> map=new HashMap<>();
		map.put("name_search", name_search);
		map.put("code_search", code_search);
		List<professorDTO> list = prService.selectList(map);
		mv.addObject("list", list);
		return mv;
	}
	
	
	
	// 면접평가 불러오기
	@GetMapping("/pr_authority")
	public ModelAndView call_in() {
		ModelAndView mv = new ModelAndView("pr_authority");
		List<HashMap<String, Object>> appl_list = prService.selectList();
		System.out.println(appl_list);
		mv.addObject("appl_list", appl_list);
		return mv;
	}
	
	// 면접평가 및 총 점수 저장 
	@PostMapping("/pr_score")
	public String score(HttpServletRequest req) {
		String interview = req.getParameter("inter_score");
		String total = req.getParameter("total_score");
		Map<String, Object> scoreSave = new HashMap<>();
		System.out.println(scoreSave);
		scoreSave.put("inter_score", interview);
		scoreSave.put("total_score", total);
			Integer interviewScore = prService.score("resultScore", scoreSave);
		return "pr_authority";
	}
	
}
