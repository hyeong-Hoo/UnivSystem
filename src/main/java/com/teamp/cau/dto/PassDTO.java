package com.teamp.cau.dto;

import lombok.Data;

@Data
public class PassDTO {
	
	private String KORN_FLNM, USER_BRDT, GENDER_CD, EML_ADDR, TELNO, REL_TELNO,RECRT_SCHDL_CD,RECRT_YEAR,USER_ID,PSWD,
	        REL_CD, ZIP, ADDR, DADDR, USER_NO, CRCLM_CD, EDU_FNSH_YN, PDF,department,category,Student_ID,CRCLM,passed,SCHDL_NAME;
	private int AGE, CRCLM_CYCL,PASS_INFO,appl_NO,avg,APPL_NUM,payment,STUD_NO; 
    private byte[] PHOTO_FILE;

}