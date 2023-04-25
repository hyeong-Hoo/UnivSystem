package com.teamp.cau.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.r_PassDTO;
@Repository
public class r_PassDAO {
	
	@Autowired
	private SqlSession sqlSession;


	public List<r_PassDTO> studentList(r_PassDTO r_PassDTO) {
		return sqlSession.selectList("r_list.studentList",r_PassDTO);
	}

	public Object passUpdate(r_PassDTO r_PassDTO) {
		return sqlSession.update("r_list.Passupdate",r_PassDTO);
	}

	public int result(r_PassDTO r_PassDTO) {
		return sqlSession.selectOne("r_list.result",r_PassDTO);
	}

	public List<r_PassDTO> departmentList() {
		return sqlSession.selectList("r_list.department");
	}

	public List<r_PassDTO> categoryList() {
		return sqlSession.selectList("r_list.categoryList");
	}


}
