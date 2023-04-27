package com.teamp.cau.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.Get_studDTO;
@Repository
public class Get_studDAO {
	
	@Autowired
	private SqlSession sqlSession;


	public List<Get_studDTO> studentList(Get_studDTO get_studDTO) {
		return sqlSession.selectList("get_List.studentList",get_studDTO);
	}

	public List<Get_studDTO> departmentList() {
		return sqlSession.selectList("get_List.department");
	}

	public List<Get_studDTO> categoryList() {
		return sqlSession.selectList("get_List.categoryList");
	}

	public void studentValue(Get_studDTO get_studDTO) {
		
		Get_studDTO resultDTO = sqlSession.selectOne("get_List.studentValue",get_studDTO);
		sqlSession.selectList("get_List.studentSubmit2", resultDTO);
		
	}


}
