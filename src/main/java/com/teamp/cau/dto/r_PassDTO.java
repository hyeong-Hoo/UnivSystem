package com.teamp.cau.dto;

import lombok.Data;

@Data
public class r_PassDTO {
	
	private String KORN_FLNM, USER_BRDT, GENDER_CD, EML_ADDR, TELNO, REL_TELNO,
	        REL_CD, ZIP, ADDR, DADDR, USER_NO, CRCLM_CD, EDU_FNSH_YN, PDF,department,category;
	private int AGE, CRCLM_CYCL,PASS_INFO,STUD_NO,avg; 
    private byte[] PHOTO_FILE;

}
