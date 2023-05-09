package com.teamp.cau.controller;

import java.time.LocalDate;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.dto.ScheduleDTO;
import com.teamp.cau.dto.Stud_infoDTO;
import com.teamp.cau.service.AdmissionService;
import com.teamp.cau.service.ScheduleService;
import com.teamp.cau.util.ConvertBinary;
import com.teamp.cau.util.RandomScore;


@Controller
public class AdmissionController {
	//파일이 저장되는 경로 설정
	private final String uploadDir = "/Users/jnews/Downloads/Cau1/src/main/resources/static/images";
	@Autowired
	private AdmissionService admissionService;
	
	@Autowired
	private ScheduleService scheduleService;

	@GetMapping("/main")
	public ModelAndView main(){
		ModelAndView mv = new ModelAndView("main");
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		ScheduleDTO dto = new ScheduleDTO();
		dto.setRECRT_YEAR(Integer.toString(year));
		List<Map<String, Object>> list = scheduleService.scheduleCheck(dto);
		mv.addObject("list",list);
		return mv;
	}
	@GetMapping("/Admission")
	public String Admission(){
		return "Admission";
	}
	@GetMapping("/Admission2")
	public String Admission2(){
		return "Admission2";
	}
	@PostMapping("/Admission2")
	public String Admission3(Stud_infoDTO dto)throws Exception{
		LocalDate now = LocalDate.now();
		ConvertBinary convert = new ConvertBinary();
		RandomScore ran = new RandomScore();

		double grade;
		double avg;
		
		
		int nowYear=now.getYear();
		int b_date=Integer.parseInt(dto.getUser_brdt().substring(0,4));
		int age=(nowYear+1)-b_date;
		String eml_addr = dto.getEmail_1()+dto.getEmail_2();
		dto.setNowYear(nowYear);
		dto.setEml_addr(eml_addr);
		dto.setAge(age);
		if (dto.getRECRT_SCHDL_CD() == 1) {
			dto.setKorean(ran.random());
			dto.setEnglish(ran.random());
			dto.setMath(ran.random());
			avg = (dto.getMath() + dto.getKorean() + dto.getEnglish()) / 3;
			dto.setAvg(avg);
		} else if (dto.getRECRT_SCHDL_CD() == 2) {
			grade = ran.edScore();
			dto.setGrade(grade);
		}
		
		String images;
		MultipartFile image = dto.getImage();
		images = convert.convertBinary(image);
		dto.setImages(images);
		
		MultipartFile fileInput = dto.getFileInput();
		  Encoder encoder = Base64.getEncoder();
			byte[] bytes = fileInput.getBytes();
			byte[] te = encoder.encode(bytes);
			dto.setPdf(te);

		int result2 = admissionService.stud_info(dto);
		return "redirect:/main";
	}
	@PostMapping(value = "/passinfo",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String passinfo(Stud_infoDTO dto) {
		
		String check = admissionService.passcheck(dto);

		System.out.println(check);
		if(check == null){
			return "0";
		}else if(check.equals("합격")){
			return "1";
		}else {
			return "2";
		}
	}
@GetMapping("testboom")
public String boom() {
	return"testboom";
}
}