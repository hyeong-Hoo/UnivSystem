package com.teamp.cau.dto;

import lombok.Data;

@Data
public class Get_studDTO {
	
	private String KORN_FLNM, USER_BRDT, GENDER_CD, EML_ADDR, TELNO, REL_TELNO,STUD_NO,PSWD,USER_ID,
	        REL_CD, ZIP, ADDR, DADDR, USER_NO, CRCLM_CD, EDU_FNSH_YN, PDF,department,category,Student_ID,CRCLM,passed;
	private int AGE, CRCLM_CYCL,PASS_INFO,appl_NO,avg,payment; 
    private byte[] PHOTO_FILE;

}
