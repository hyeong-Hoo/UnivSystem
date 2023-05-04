package com.teamp.cau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.Get_studDAO;
import com.teamp.cau.dto.Get_studDTO;

@Service
public class Get_studService {
	@Autowired
	private Get_studDAO get_studDAO;
	
	 private PasswordEncoder passwordEncoder;
	    
	    @Autowired
	    public Get_studService(PasswordEncoder passwordEncoder) {
	        this.passwordEncoder = passwordEncoder;
	    }
	
	public List<Get_studDTO> studentList(Get_studDTO Get_studDTO) {
		return get_studDAO.studentList(Get_studDTO);
	}


	public List<Get_studDTO> departmentList() {
		return get_studDAO.departmentList();
	}

	public List<Get_studDTO> categoryList() {
		return get_studDAO.categoryList();
	}
	
	public void studentValue(Get_studDTO get_studDTO) {
        String encodedPassword = passwordEncoder.encode("123456789a");
        get_studDTO.setPSWD(encodedPassword);
        get_studDTO.setUSER_ID(get_studDTO.getStudent_ID());
        get_studDAO.studentValue(get_studDTO);
    }

}
