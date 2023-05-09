package com.teamp.cau.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		 try {
		        int payment = paymentService.paymentList(KORN_FLNM, USER_BRDT);
		        System.out.println(payment);

		        if (payment == 0) { // payment 값이 0일 경우에만 업데이트
		            if (paymentService.checkPayment(KORN_FLNM, USER_BRDT, payment)) {
		                paymentService.updatePayment(KORN_FLNM, USER_BRDT, payment);
		                return "{\"status\":\"success\"}";
		            } else {
		                return "{\"status\":\"failed\"}";
		            }   
		        } else { // payment 값이 1일 경우에는 결제를 막고 실패를 반환
		            return "{\"status\":\"blocked\"}";
		        }
		    } catch (NullPointerException e) {
		        return "{\"status\":\"failed\"}";
		    }
		}




}

