package com.teamp.cau.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.professorDAO;
import com.teamp.cau.dto.professorDTO;

@Service
public class professorService {

	@Autowired
	private professorDAO prDAO;

	// 교수정보 불러오기 
	public List<professorDTO> prinfo() {
		return prDAO.prinfo();
	}

	//교수정보 검색 
	public List<professorDTO> selectList(HashMap<String, String> search) {
		return prDAO.search(search);
	}

	//교수정보입력 저장 
	public Integer insert(String string, Map<String, Object> infoEnter) {
		return prDAO.insert(infoEnter);
	}

	public List<HashMap<String, Object>> selectList() {
		return prDAO.select();
	}

	// 면접점수 저장 
	public Integer score(String string, Map<String, Object> scoreSave) {
		return prDAO.result(scoreSave);
	}

	

	
}
