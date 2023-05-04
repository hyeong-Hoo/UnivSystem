package com.teamp.cau.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.ScheduleDTO;

@Repository
@Mapper
public interface ScheduleDAO {

	List<Map<String, Object>> tableList();

	List<Map<String, Object>> scheduleCheck(ScheduleDTO dto);

}
