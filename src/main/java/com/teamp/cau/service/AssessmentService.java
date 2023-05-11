package com.teamp.cau.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.AssessmentDAO;
import com.teamp.cau.dto.StudentDTO;

@Service
public class AssessmentService {
	
	@Autowired
	private AssessmentDAO assessmentDAO;


	public List<StudentDTO> data() {
		return assessmentDAO.data() ;
	}


	public void updateAssessment(List<StudentDTO> assessments) {
	    for (StudentDTO assessment : assessments) {
	        assessmentDAO.updateAssessment(assessment);
	    }
	}


	public Map<String, Object> selectPdf() {

		return assessmentDAO.selectPdf();
	}


	


		

}
