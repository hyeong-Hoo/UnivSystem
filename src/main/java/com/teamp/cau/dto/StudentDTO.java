package com.teamp.cau.dto;

import lombok.Data;

@Data
public class StudentDTO {
	
	private String KORN_FLNM, USER_BRDT, GENDER_CD, EML_ADDR, TELNO, REL_TELNO,
	        REL_CD, ZIP, ADDR, DADDR, USER_NO, CRCLM_CD, EDU_FNSH_YN, category, department, passed;
	private int AGE, CRCLM_CYCL, math, english, avg, korean, appl_NO, grade, interview;
    private byte[] PHOTO_FILE;

}
