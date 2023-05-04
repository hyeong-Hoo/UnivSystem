package com.teamp.cau.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ScheduleDAO {

	List<Map<String, Object>> tableList();

}
