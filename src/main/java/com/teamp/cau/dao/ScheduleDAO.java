package com.teamp.cau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.ScheduleDTO;

@Repository
@Mapper
public interface ScheduleDAO {

	List<ScheduleDTO> tableList();

}
