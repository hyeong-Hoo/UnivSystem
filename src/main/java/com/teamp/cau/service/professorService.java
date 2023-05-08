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

	public List<professorDTO> prinfo() {
		return prDAO.prinfo();
	}

	public List<professorDTO> selectList(HashMap<String, String> search) {
		return prDAO.search(search);
	}

	public Integer insert(String string, Map<String, Object> infoEnter) {
		return prDAO.insert(infoEnter);
	}

	public Object giveAuth(String string, Map<String, Object> give) {
		return prDAO.update(give);
	}

	public List<HashMap<String, Object>> selectList() {
		return prDAO.select();
	}

	public Integer score(String string, Map<String, Object> scoreSave) {
		return prDAO.insert(scoreSave);
	}
	
}
