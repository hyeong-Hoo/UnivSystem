package com.teamp.cau.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamp.cau.dto.StudentDTO;
import com.teamp.cau.service.PaymentService;


@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	@GetMapping("/payment")
	public String payment() {
		return "payment";
	}
	
	
	@ResponseBody
	@GetMapping("/pms")	
	public String payments(@RequestParam("KORN_FLNM") String KORN_FLNM, @RequestParam("USER_BRDT") String USER_BRDT) {
		
		 paymentService.updatePayment(KORN_FLNM, USER_BRDT);
	        return "Payment updated successfully!";
	    }

}
