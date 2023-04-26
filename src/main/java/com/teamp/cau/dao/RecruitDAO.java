package com.teamp.cau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.RecruitDTO;

@Repository
@Mapper
public interface RecruitDAO {

	List<RecruitDTO> year();

	List<RecruitDTO> depart();

}
