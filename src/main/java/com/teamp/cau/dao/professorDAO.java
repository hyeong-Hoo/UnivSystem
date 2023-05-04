package com.teamp.cau.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.professorDTO;

@Repository
public class professorDAO {

	@Autowired
	private SqlSession sqlsession;

	public List<professorDTO> prinfo() {
		return sqlsession.selectList("INSTR_INFO.prlist");
	}
	public List<professorDTO> search(HashMap<String,String> map){
		return sqlsession.selectList("INSTR_INFO.search",map);
	}
	
	
}
