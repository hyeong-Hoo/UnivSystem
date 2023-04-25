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

	public  List<PassDTO> studentList(PassDTO passDTO) {
		return passDAO.studentList(passDTO);
	}

	public void passUpdate(PassDTO passDTO) {
		passDAO.passUpdate(passDTO);
	}

	public int result(PassDTO passDTO) {
		return passDAO.result(passDTO);
	}

	public List<PassDTO> departmentList() {
		return passDAO.departmentList();
	}

	public List<PassDTO> categoryList() {
		return passDAO.categoryList();
	}

	public List<PassDTO> studentValue(PassDTO passDTO) {
		return passDAO.studentValue(passDTO);
	}


}
