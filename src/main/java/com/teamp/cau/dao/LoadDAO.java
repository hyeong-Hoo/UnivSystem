package com.teamp.cau.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LoadDAO {

	Map<String, Object> selectPdf();
	
	byte[] selectbyte();


}
