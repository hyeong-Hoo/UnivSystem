package com.teamp.cau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.professorDAO;
import com.teamp.cau.dto.professorDTO;

@Service
public class professorService {

	@Autowired
	private professorDAO prDAO;

	public List<professorDTO> prinfo() {
		return prDAO.prinfo();
	}
	
}
