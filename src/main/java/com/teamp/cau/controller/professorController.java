package com.teamp.cau.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.dto.RecruitDTO;
import com.teamp.cau.dto.professorDTO;
import com.teamp.cau.service.RecruitService;
import com.teamp.cau.service.professorService;
import com.teamp.cau.util.ConvertBinary;

@Controller
public class professorController {

	@Autowired
	private professorService prService;
	
	@Autowired
	private RecruitService recruitService;
	
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
		Integer enter = prService.prinfo_save(infoEnter); // instr_info로
		Integer enter2 = prService.instr_user(infoEnter); // user_info로
		return "professor";
	}

	// 교수본인정보 수정 불러오기
	@GetMapping("/self_modify")
	public String modify() {
		return "self_modify";
	}

	// 교수본인정보 수정
	@PostMapping("/pr_self")
	public String self_save(@RequestParam("pr_no") String pr_no, @RequestParam("name_kr") String name_kr,
			@RequestParam("name_en") String name_en, @RequestParam("roadAddrPart1") String roadAddrPart1,
			@RequestParam("addrDetail") String addrDetail, @RequestParam("pr_telno") String pr_telno,
			@RequestParam("pr_email") String pr_email, @RequestParam("pr_birth") String pr_birth,
			@RequestParam("pr_gender") String pr_gender, @RequestParam("image") MultipartFile image) throws Exception {

		ConvertBinary convert = new ConvertBinary();
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
		String images;
		images = convert.convertBinary(image);
		selfmodi.put("IMG_FILE", images);
		System.out.println(selfmodi);
		prService.selfSave(selfmodi);
		return "self_modify";
	}

	// 교수정보 불러오기
	@GetMapping("/pr_info")
	public ModelAndView prinfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("pr_info");
		List<professorDTO> list = prService.prinfo();
		List<RecruitDTO> depart = recruitService.depart();
		mv.addObject("list", list);
		mv.addObject("depart",depart);
		return mv;
	}

	// 교수정보 검색
	@GetMapping("/pr_info_search")
	@ResponseBody
	public List<Map<String, Object>> search(@RequestParam("code") String code, @RequestParam("name") String name) {
		if(name == "") {
			name = "all";
		}
		professorDTO dto = new professorDTO();
		dto.setCRCLM_CD(code);
		dto.setKORN_FLNM(name);
		List<Map<String, Object>> list = prService.selectList(dto);
		return list;
	}

	// 권한주기
		@PostMapping("/pr_info_auth")
		@ResponseBody
		public String auth(@RequestParam HashMap<String, Object> autest, @RequestParam("num") int num) {	
			List<HashMap<String,Integer>> dto= new ArrayList<>();
			for (int i = 0; i < num; i++) {
				HashMap<String,Integer> map= new HashMap<>();
				map.put("INSTR_NO", Integer.parseInt((String) autest.get("auth_test[" + i + "][no]")));
				map.put("ENDST_NO", Integer.parseInt((String) autest.get("auth_test[" + i + "][auth]")));
				dto.add(map);}
			prService.giveautest(dto);
			return "redirect:/pr_info";
		}

	// 면접평가 불러오기
	@GetMapping("/pr_authority")
	public ModelAndView call_in() {
		ModelAndView mv = new ModelAndView("pr_authority");
		List<HashMap<String, Object>> appl_list = prService.selectList();
		// System.out.println(appl_list);
		mv.addObject("appl_list", appl_list);
		return mv;
	}

	// 면접평가 및 총 점수 저장
	@PostMapping("/pr_score")
	public String score(HttpServletRequest req) {
		String[] appl_no = req.getParameterValues("appl_no");
		String[] interview = req.getParameterValues("inter_score");
		List<HashMap<String, Integer>> list = new ArrayList<HashMap<String, Integer>>();
		for (int i = 0; i < appl_no.length; i++) {
			HashMap<String, Integer> res_inner = new HashMap<String, Integer>();
			res_inner.put("appl_no", Integer.parseInt(appl_no[i]));
			res_inner.put("inter_score", Integer.parseInt(interview[i]));
			list.add(res_inner);

		}
		int result_row = prService.resultpoint(list);

		return "redirect:/pr_authority";
	}

}



















// test 
//		for (int i = 0; i < interview.length; i++) {
//			professorDTO dto = new professorDTO();
//			if (interview[i] != "0" || interview[i] != null || interview[i] != "") {
//				dto.setAppl_NO(Integer.parseInt(appl_no[i]));
//				dto.setInterview(Integer.parseInt(interview[i]));
//			}
//			res.add(dto);
//		}
//		for (int i = res.size()-1;  i >= 0; i--) {
//			if(res.get(i).getInterview() == 0) {
//				res.remove(i);
//			}
//		}
// for (professorDTO d : res) {
// System.out.println(d.getAppl_NO() + ":::" + d.getInterview());
// }
//		professorDTO dto = new professorDTO();
//		System.out.println(req.getParameterValues("inter_score"));
//		for (int i = 0; i < appl_no.length; i++) {
//
//			 prService.scoreSave(dto);
//		}
//		scoreSave.put("inter_score", interview);
//		scoreSave.put("totalscore", total);
//		System.out.println(Arrays.toString());
//		Integer interviewScore = prService.resultscore("resultScore", scoreSave);