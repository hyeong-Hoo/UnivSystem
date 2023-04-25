package com.teamp.cau.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.dto.r_PassDTO;
import com.teamp.cau.service.r_PassService;
@Controller
public class r_PassController {
	
	@Autowired
	private r_PassService r_passService;
	
	
	@GetMapping("/r_pass")
	public ModelAndView Passed() {
		List<r_PassDTO> list_d = r_passService.departmentList();
		List<r_PassDTO> list_c = r_passService.categoryList();
		ModelAndView mv = new ModelAndView("r_pass");
		mv.addObject("list_d", list_d);
		mv.addObject("list_c", list_c);
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/r_passInfo")
	public List<r_PassDTO> Pass(@RequestParam(value = "KORN_FLNM", required = false) String KORN_FLNM ,@RequestParam(value = "department", required = false) String department,@RequestParam(value = "category", required = false) String category) {
		r_PassDTO r_PassDTO = new r_PassDTO();
		r_PassDTO.setDepartment(department);
		r_PassDTO.setCategory(category);
		r_PassDTO.setKORN_FLNM(KORN_FLNM);
		List<r_PassDTO> list = r_passService.studentList(r_PassDTO);
		return list;
	}
	@ResponseBody
	@PostMapping("/r_passUpdate")
	public String passUpdate(@RequestParam("stud_NO") int a,@RequestParam("PASS_INFO") int b) {
		r_PassDTO r_PassDTO = new r_PassDTO();
		r_PassDTO.setSTUD_NO(a);
		r_PassDTO.setPASS_INFO(b);
		r_passService.passUpdate(r_PassDTO);
		int result=r_passService.result(r_PassDTO);
		return String.valueOf(result);
	}
	@PostMapping("/r_permit1")
	@ResponseBody
	public String permit1(@RequestParam HashMap<String, Object> param,@RequestParam("num") int num) {
		message message = new message();
		for(int i=0;i<num;i++) {		
			String telno= (String) param.get("checkBoxArr["+i+"][telno_m]");
			String content = param.get("checkBoxArr["+i+"][name_m]")+"님 국민은행 938002-00-123456 으로 입금해주시면 등록이 확정이됩니다..";
			message.sendSMS(telno, content);
		}
		return "";
	}
}
