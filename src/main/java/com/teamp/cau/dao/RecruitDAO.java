package com.teamp.cau.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamp.cau.dto.RecruitDTO;

public class RecruitDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<RecruitDTO> selectList() {
		
		return sqlSession.selectList("recruit.selectList");
	}

}
