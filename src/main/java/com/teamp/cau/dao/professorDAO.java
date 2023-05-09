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

	// 교수정보 검색 
	public List<professorDTO> search(HashMap<String,String> map){
		return sqlsession.selectList("INSTR_INFO.search",map);
	}
	
	//교수정보 입력 저장
	public Integer insert(Map<String, Object> infoEnter) {
		return sqlsession.insert("INSTR_INFO.prinfo_save", infoEnter);
	}
	
	// 교수정보 불러오기 
	public List<professorDTO> prinfo() {
		return sqlsession.selectList("INSTR_INFO.prlist");
	}

	// 지원자 정보 불러오기 
	public List<HashMap<String, Object>> select() {
		return sqlsession.selectList("APPL_INFO.callin");
	}
	
	// 면접점수 저장 
	public Integer result(Map<String, Object> scoreSave) {
			return sqlsession.insert("APPL_INFO.resultScore", scoreSave);
	}

	
	
	
}
