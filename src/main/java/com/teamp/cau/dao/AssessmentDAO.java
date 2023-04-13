package com.teamp.cau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.AssessmentDTO;

@Repository
@Mapper
public interface AssessmentDAO {

	List<AssessmentDTO> data();

	void updateAvg();

	void updateAssessment(AssessmentDTO assessment);

	

	



}
