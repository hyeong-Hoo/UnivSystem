package com.teamp.cau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.AssessmentDAO;
import com.teamp.cau.dto.AssessmentDTO;

@Service
public class AssessmentService {
	
	@Autowired
	private AssessmentDAO assessmentDAO;

	public List<AssessmentDTO> asmList() {
		return assessmentDAO.asmList();
	}

}
