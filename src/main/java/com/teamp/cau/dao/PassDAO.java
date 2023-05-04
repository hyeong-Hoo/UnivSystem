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

	public void studentValue(PassDTO passDTO) {
		
		PassDTO resultDTO = sqlSession.selectOne("list.studentValue",passDTO);
		sqlSession.selectList("list.studentSubmit1", resultDTO);
		
	}

	public int studentLimit(PassDTO passDTO) {
		return sqlSession.selectOne("list.studentLimit",passDTO);
	}

}
