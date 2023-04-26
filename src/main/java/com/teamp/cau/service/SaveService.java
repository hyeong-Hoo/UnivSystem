package com.teamp.cau.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.SaveDAO;

@Service
public class SaveService {
	@Autowired
	private SaveDAO saveDAO;

	public void savePDF(Map<String, Object> map) {
		saveDAO.savePDF(map);
		
	}

}
