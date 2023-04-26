package com.teamp.cau.dto;

import java.util.Date;

import lombok.Data;

@Data
public class RecruitDTO {

	private int RECRT_CD, CRCLM_CD, RECRT_SCHDL_CD, RECRT_PER, RECRT_PHASE, RECRT_PAY, APPL_NUM, NUM_MUL;
	private String SCHDL_NAME, SCHDL_EXPLN, DEPARTMENT, YEAR;
	private Date SCHDL_START, SCHDL_END;
	
}
