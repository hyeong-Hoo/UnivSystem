package com.teamp.cau.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.cau.dao.ScheduleDAO;
import com.teamp.cau.dto.ScheduleDTO;

@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleDAO scheduleDAO;

	public List<Map<String, Object>> tableList() {
		
		return scheduleDAO.tableList();
	}

	
	
}
