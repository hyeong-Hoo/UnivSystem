package com.teamp.cau.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SaveDAO {

	void savePDF(Map<String, Object> map);

}
