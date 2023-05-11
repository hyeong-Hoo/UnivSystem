package com.teamp.cau.controller;


import java.nio.charset.StandardCharsets;
import java.sql.Blob;
import java.sql.SQLException;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.cau.service.LoadService;



@Controller
public class LoadController {
	
	@Autowired
	private LoadService loadService;

	
	@RequestMapping(value = "/load")
	public ModelAndView getPdf() throws SQLException, java.io.IOException {
	    Map<String,Object> resultMap = loadService.selectPdf();   
	   
	    Blob pdf = (Blob) resultMap.get("pdf");
	    String pdfSrc = new String(pdf.getBytes(1, (int)pdf.length()), StandardCharsets.UTF_8);
	    
//	    pdf.getBytes(1, (int)pdf.length()): pdf 변수에 저장된 Blob 데이터에서 1번째부터 끝까지의 byte 배열을 가져옵니다.
//	    new String(바이트배열, StandardCharsets.UTF_8): byte 배열을 StandardCharsets.UTF_8로 인코딩하여 문자열로 변환합니다.
	        
	    System.out.println(pdfSrc);
	        
	        ModelAndView mv = new ModelAndView("load");
	        mv.addObject("pdfSrc", pdfSrc);
	        return mv;
	   
	}



}
