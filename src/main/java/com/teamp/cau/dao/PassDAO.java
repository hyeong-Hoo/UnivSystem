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

	public List<PassDTO> studentList(PassDTO passDTO) {
		return sqlSession.selectList("list.studentList",passDTO);
	}

	public Object passUpdate(PassDTO passDTO) {
		return sqlSession.update("list.Passupdate",passDTO);
	}

	public int result(PassDTO passDTO) {
		return sqlSession.selectOne("list.result",passDTO);
	}

	public List<PassDTO> departmentList() {
		return sqlSession.selectList("list.department");
	}

	public List<PassDTO> categoryList() {
		return sqlSession.selectList("list.categoryList");
	}

	public List<PassDTO> studentValue(PassDTO passDTO) {
		return sqlSession.selectList("list.studentValue",passDTO);
	}


}
