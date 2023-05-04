package com.teamp.cau.controller;

import com.teamp.cau.dto.Stud_infoDTO;
import com.teamp.cau.service.AdmissionService;
import com.teamp.cau.service.UserService;
import com.teamp.cau.util.ConvertBinary;
import com.teamp.cau.util.RandomScore;
import com.teamp.cau.vo.UserVo;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Controller

public class AdmissionController {
	//파일이 저장되는 경로 설정
	private final String uploadDir = "/Users/jnews/Downloads/Cau1/src/main/resources/static/images";
	@Autowired
	private AdmissionService admissionService;
	private UserService userService;
	@Autowired
	private SqlSession sqlSession;

	@GetMapping("/main")
	public String main(){
		return "main";
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
		dto.setEml_addr(eml_addr);
		dto.setAge(age);
		if (dto.getCategory().equals("정시")) {
			dto.setKorean(ran.random());
			dto.setEnglish(ran.random());
			dto.setMath(ran.random());
			avg = (dto.getMath() + dto.getKorean() + dto.getEnglish()) / 3;
			dto.setAvg(avg);
		} else if (dto.getCategory().equals("수시")) {
			grade = ran.edScore();
			dto.setGrade(grade);
		}

		MultipartFile file=dto.getFile();
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			log.info("file.getOriginalFilename = {}", filename);
			String fullPath = uploadDir + filename;
			dto.setPdf(fullPath);
			file.transferTo(new File(fullPath));
		}
		String images;
		MultipartFile image = dto.getImage();
		images = convert.convertBinary(image);
		dto.setImages(images);

		int result2 = admissionService.stud_info(dto);
		return "redirect:/main";
	}


}