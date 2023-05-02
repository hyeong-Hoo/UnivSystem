package com.teamp.cau.dto;

import java.util.Date;

import lombok.Data;

@Data
public class RecruitDTO {
	private int RECRT_YEAR, RECRT_SCHDL_CD, CRCLM_CD, APPL_NUM, NUM_MUL;
	private String SCHDL_NAME, DEPARTMENT;
	private Date SCHDL_START, SCHDL_END_DT;
	
}
