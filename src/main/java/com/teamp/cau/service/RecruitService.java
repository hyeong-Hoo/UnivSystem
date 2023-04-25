package com.teamp.cau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.RecruitDAO;
import com.teamp.cau.dto.RecruitDTO;

@Service
public class RecruitService {
	
	@Autowired
	private RecruitDAO recruitDAO;
	
	public List<RecruitDTO> selectList() {
		
		return recruitDAO.selectList();
	}

}
