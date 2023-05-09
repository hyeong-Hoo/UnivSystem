package com.teamp.cau.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.PassDTO;
@Repository
public class Pass_idDAO {
	
	@Autowired
	private SqlSession sqlSession;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


	public List<PassDTO> studentList(PassDTO passDTO) {
		return sqlSession.selectList("list_id.studentList",passDTO);
	}

	public List<PassDTO> departmentList() {
		return sqlSession.selectList("list_id.department");
	}

	public List<PassDTO> categoryList() {
		return sqlSession.selectList("list_id.categoryList");
	}

	public void studentValue(PassDTO passDTO) {
		
		PassDTO resultDTO = sqlSession.selectOne("list_id.studentValue",passDTO);
		resultDTO.setStudent_ID(passDTO.getStudent_ID());
		sqlSession.selectList("list.studentSubmit1", resultDTO);
		
		PassDTO resultDTO1 = sqlSession.selectOne("list_id.studentValue1",passDTO);
		resultDTO1.setPSWD(passwordEncoder.encode("123456789a"));
		sqlSession.selectList("list.studentSubmit2", resultDTO1);
		
	}

	public int studentLimit(PassDTO passDTO) {
		return sqlSession.selectOne("list.studentLimit",passDTO);
	}

}



