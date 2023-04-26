package com.teamp.cau.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamp.cau.service.SaveService;

@Controller
public class SaveController {
	
	@Autowired
	private SaveService saveService;
	
	@GetMapping("/save")
	public String save() {
		return "save";
		
	}
	
	@RequestMapping(value = "/saves", method = RequestMethod.POST, consumes="application/x-www-form-urlencoded")
	@ResponseBody
	public String savePost(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		Map<String,Object> map = new HashMap<String, Object>();
	    
		String base64 = paramMap.get("base64").toString();
	    
		byte[] bytes = base64.getBytes();
	    
		map.put("bytes",bytes);
		
		System.out.println(map);
	    
		saveService.savePDF(map);
	    
		return "";
	}

}
