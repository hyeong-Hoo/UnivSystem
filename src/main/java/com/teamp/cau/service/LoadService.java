package com.teamp.cau.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.LoadDAO;

@Service
public class LoadService {
	@Autowired
	private LoadDAO loadDAO;
		
	public Map<String, Object> selectPdf() {
		return loadDAO.selectPdf();
		
		
	}
	public byte[] selectbyte() {
	    return loadDAO.selectbyte();
	}
	

}
