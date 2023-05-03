package com.teamp.cau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.PaymentDAO;
import com.teamp.cau.dto.StudentDTO;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;

	public List<StudentDTO> paymentList(String KORN_FLNM, String USER_BRDT) {
		
		return paymentDAO.paymentList(KORN_FLNM, USER_BRDT);
	}

	public void updatePayment(String KORN_FLNM, String USER_BRDT) {
		paymentDAO.updatePayment(KORN_FLNM, USER_BRDT);
		
	}

	

}
