package com.teamp.cau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.r_PassDAO;
import com.teamp.cau.dto.r_PassDTO;

@Service
public class r_PassService {
	@Autowired
	private r_PassDAO r_passDAO;


	public  List<r_PassDTO> studentList(r_PassDTO r_PassDTO) {
		return r_passDAO.studentList(r_PassDTO);
	}

	public void passUpdate(r_PassDTO r_PassDTO) {
		r_passDAO.passUpdate(r_PassDTO);
	}

	public int result(r_PassDTO r_PassDTO) {
		return r_passDAO.result(r_PassDTO);
	}

	public List<r_PassDTO> departmentList() {
		return r_passDAO.departmentList();
	}

	public List<r_PassDTO> categoryList() {
		return r_passDAO.categoryList();
	}


}
