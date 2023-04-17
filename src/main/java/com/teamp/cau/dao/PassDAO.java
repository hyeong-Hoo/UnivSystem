package com.teamp.cau.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.PassDTO;
@Repository
public class PassDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public  PassDTO detail(String PDF) {
		return sqlSession.selectOne("list.detail", PDF);
	}

	public List<PassDTO> studentList(String KORN_FLNM) {
		return sqlSession.selectList("list.studentList",KORN_FLNM);
	}

}
