package com.teamp.cau.dto; 

import org.springframework.web.multipart.MultipartFile;

public class professorDTO {

	private String KORN_FLNM, USER_BRDT, EML_ADDR, TELNO, ADDR, DADDR, GENDER, CRCLM_CD, 
					GENDER_CD, department, INSTR_ID, INSTR_PW, ENG_FLNM, ROLE_CODE;
	public String getROLE_CODE() {
		return ROLE_CODE;
	}

	public void setROLE_CODE(String rOLE_CODE) {
		ROLE_CODE = rOLE_CODE;
	}

	private int INSTR_NO, appl_NO, RECRT_YEAR, total, grade, ENDST_NO, interview, RECRT_SCHDL_CD;
	public int getRECRT_SCHDL_CD() {
		return RECRT_SCHDL_CD;
	}

	public void setRECRT_SCHDL_CD(int rECRT_SCHDL_CD) {
		RECRT_SCHDL_CD = rECRT_SCHDL_CD;
	}

	private MultipartFile IMG_FILE;

	public String getENG_FLNM() {
		return ENG_FLNM;
	}

	public void setENG_FLNM(String eNG_FLNM) {
		ENG_FLNM = eNG_FLNM;
	}

	public MultipartFile getIMG_FILE() {
		return IMG_FILE;
	}

	public void setIMG_FILE(MultipartFile iMG_FILE) {
		IMG_FILE = iMG_FILE;
	}

	public String getINSTR_ID() {
		return INSTR_ID;
	}

	public void setINSTR_ID(String iNSTR_ID) {
		INSTR_ID = iNSTR_ID;
	}

	public String getINSTR_PW() {
		return INSTR_PW;
	}

	public void setINSTR_PW(String iNSTR_PW) {
		INSTR_PW = iNSTR_PW;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}


	public String getGENDER_CD() {
		return GENDER_CD;
	}

	public void setGENDER_CD(String gENDER_CD) {
		GENDER_CD = gENDER_CD;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getAppl_NO() {
		return appl_NO;
	}

	public void setAppl_NO(int appl_NO) {
		this.appl_NO = appl_NO;
	}

	public int getRECRT_YEAR() {
		return RECRT_YEAR;
	}

	public void setRECRT_YEAR(int rECRT_YEAR) {
		RECRT_YEAR = rECRT_YEAR;
	}

	public int gettotal() {
		return total;
	}

	public void settotal(int avg) {
		this.total = avg;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getInterview() {
		return interview;
	}

	public void setInterview(int interview) {
		this.interview = interview;
	}

	public String getCRCLM_CD() {
		return CRCLM_CD;
	}

	public void setCRCLM_CD(String cRCLM) {
		CRCLM_CD = cRCLM;
	}

	public int getINSTR_NO() {
		return INSTR_NO;
	}

	public void setINSTR_NO(int iNSTR_NO) {
		INSTR_NO = iNSTR_NO;
	}



	public String getKORN_FLNM() {
		return KORN_FLNM;
	}

	public void setKORN_FLNM(String kORN_FLNM) {
		KORN_FLNM = kORN_FLNM;
	}

	public String getUSER_BRDT() {
		return USER_BRDT;
	}

	public void setUSER_BRDT(String uSER_BRDT) {
		USER_BRDT = uSER_BRDT;
	}

	public String getEML_ADDR() {
		return EML_ADDR;
	}

	public void setEML_ADDR(String eML_ADDR) {
		EML_ADDR = eML_ADDR;
	}

	public String getTELNO() {
		return TELNO;
	}

	public void setTELNO(String tELNO) {
		TELNO = tELNO;
	}

	public String getADDR() {
		return ADDR;
	}

	public void setADDR(String aDDR) {
		ADDR = aDDR;
	}

	public String getDADDR() {
		return DADDR;
	}

	public void setDADDR(String dADDR) {
		DADDR = dADDR;
	}

	public String getGENDER() {
		return GENDER;
	}

	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}

	public int getENDST_NO() {
		return ENDST_NO;
	}

	public void setENDST_NO(int eNDST_NO) {
		ENDST_NO = eNDST_NO;
	}

}
