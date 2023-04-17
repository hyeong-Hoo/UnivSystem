package com.teamp.cau.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.PassDAO;
import com.teamp.cau.dto.PassDTO;

@Service
public class PassService {
	@Autowired
	private PassDAO passDAO;

	public PassDTO detail(String PDF) {
		return passDAO.detail(PDF);
}

	public  List<PassDTO> studentList(String KORN_FLNM) {
		return passDAO.studentList(KORN_FLNM);
	}

}
