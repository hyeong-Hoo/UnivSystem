package com.teamp.cau.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
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
	
	// 교수정보입력 저장 
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
		Integer enter = prService.prinfo_save(infoEnter);	// instr_info로
		Integer enter2 = prService.instr_user(infoEnter);	// user_info로 
		return "professor";
	}
	
	
	// 교수본인정보 수정 불러오기 
	@GetMapping("/self_modify")
	public String modify( ) {
		return "self_modify";
	}
	
	// 교수본인정보 수정 
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
		Integer modify = prService.selfSave(selfmodi);
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
	
	//권한주기 
	@PostMapping("/pr_info_auth")
	public String auth(@RequestParam("num") int num, @RequestParam HashMap<String, Object> autest ) {
		professorDTO authdto = new professorDTO();
		for (int i = 0; i < num; i++) {
			int pr_no = Integer.parseInt((String)autest.get("auth_test [" + i + "][no]" ));
			int authority = Integer.parseInt((String)autest.get("auth_test [" + i + "][auth]" ));
			authdto.setINSTR_NO(pr_no);
			authdto.setENDST_NO(authority);
			prService.test(authdto);
			System.out.println(pr_no);
		}
		
		return "redirect:/pr_info";
	}
	
	
	// 면접평가 불러오기
	@GetMapping("/pr_authority")
	public ModelAndView call_in() {
		ModelAndView mv = new ModelAndView("pr_authority");
		List<HashMap<String, Object>> appl_list = prService.selectList();
		//System.out.println(appl_list);
		mv.addObject("appl_list", appl_list);
		return mv;
	}
	
	// 면접평가 및 총 점수 저장 
	@PostMapping("/pr_score")
	public String score(HttpServletRequest req) {
		String[] appl_no = req.getParameterValues("appl_no");
		String[] interview = req.getParameterValues("inter_score");
		List<HashMap<String,Integer>> list = new ArrayList<HashMap<String,Integer>>();
		for(int i=0;i<appl_no.length;i++) {
			HashMap<String,Integer> res_inner=new HashMap<String,Integer>();
			res_inner.put("appl_no",Integer.parseInt(appl_no[i]));
			res_inner.put("inter_score",Integer.parseInt(interview[i]));
			list.add(res_inner);
		
		}
		int result_row=prService.resultpoint(list);
//		
//		for (int i = 0; i < interview.length; i++) {
//			professorDTO dto = new professorDTO();
//			if (interview[i] != "0" || interview[i] != null || interview[i] != "") {
//				dto.setAppl_NO(Integer.parseInt(appl_no[i]));
//				dto.setInterview(Integer.parseInt(interview[i]));
//			}
//			res.add(dto);
//		}
//		
//		for (int i = res.size()-1;  i >= 0; i--) {
//			if(res.get(i).getInterview() == 0) {
//				res.remove(i);
//			}
//		}
//		
		//for (professorDTO d : res) {
		//	System.out.println(d.getAppl_NO() + ":::" + d.getInterview());
		//}
		
		
		professorDTO dto = new professorDTO();
		System.out.println(req.getParameterValues("inter_score"));
		for (int i = 0; i < appl_no.length; i++) {
			
			//prService.scoreSave(dto);
		}
		
		
		
//		scoreSave.put("inter_score", interview);
//		scoreSave.put("totalscore", total);
//		System.out.println(Arrays.toString());
//		Integer interviewScore = prService.resultscore("resultScore", scoreSave);
		return "redirect:/pr_authority";
	}
	
}
