package com.teamp.cau.dto;

import lombok.Data;

@Data
public class PassDTO {
	
	private String KORN_FLNM, USER_BRDT, GENDER_CD, EML_ADDR, TELNO, REL_TELNO,
	        REL_CD, ZIP, ADDR, DADDR, USER_NO, CRCLM_CD, EDU_FNSH_YN, PDF;
	private int AGE, CRCLM_CYCL,PASS_INFO,STUD_NO; 
    private byte[] PHOTO_FILE;

}
