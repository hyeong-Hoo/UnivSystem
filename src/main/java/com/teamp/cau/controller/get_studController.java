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

import com.teamp.cau.dto.Get_studDTO;
import com.teamp.cau.service.Get_studService;

@Controller
public class get_studController {

	@Autowired
	private Get_studService get_studService;

	@GetMapping("/get_stud")
	public ModelAndView Passed() {
		List<Get_studDTO> list_d = get_studService.departmentList();
		List<Get_studDTO> list_c = get_studService.categoryList();
		ModelAndView mv = new ModelAndView("get_stud");
		mv.addObject("list_d", list_d);
		mv.addObject("list_c", list_c);
//		Calendar cal = Calendar.getInstance();
//        int year = cal.get(Calendar.YEAR);
//        System.out.println("현재 년도: " + year);
		return mv;
	}

	@ResponseBody
	@GetMapping("/create_id")
	public List<Get_studDTO> Pass(@RequestParam(value = "KORN_FLNM", required = false) String KORN_FLNM,
			@RequestParam(value = "department", required = false) String department,
			@RequestParam(value = "category", required = false) String category) {
		Get_studDTO get_studDTO = new Get_studDTO();
		get_studDTO.setDepartment(department);
		get_studDTO.setCategory(category);
		get_studDTO.setKORN_FLNM(KORN_FLNM);
		List<Get_studDTO> list = get_studService.studentList(get_studDTO);
		return list;
	}

	@ResponseBody
	@PostMapping("/id_save")
	public String StudentID(@RequestParam HashMap<String, Object> param, @RequestParam("num") int num) {
		Get_studDTO get_studDTO = new Get_studDTO();
		for (int i = 0; i < num; i++) {
			int appl_NO = Integer.parseInt((String) param.get("checkBoxArr[" + i + "][appl_NO]"));
			get_studDTO.setAppl_NO(appl_NO);
			get_studService.studentValue(get_studDTO);
		}
		return "";
	}

}
