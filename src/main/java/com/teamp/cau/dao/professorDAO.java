package com.teamp.cau.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamp.cau.dto.professorDTO;

@Repository
public class professorDAO {

	@Autowired
	private SqlSession sqlsession;

	
	public List<professorDTO> search(HashMap<String,String> map){
		return sqlsession.selectList("INSTR_INFO.search",map);
	}
	public Integer insert(Map<String, Object> infoEnter) {
		return sqlsession.insert("INSTR_INFO.prinfo_save", infoEnter);
	}
	public Object update(Map<String, Object> give) {
		return sqlsession.update("INSTR_INFO.give_auth",give);
	}
	public List<professorDTO> prinfo() {
		return sqlsession.selectList("INSTR_INFO.prlist");
	}
	
	public List<HashMap<String, Object>> select() {
		return sqlsession.selectList("APPL_INFO.callin");
	}
	
	
}
