package com.teamp.cau.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ScheduleDTO {

	private int  RECRT_SCHDL_CD;
	private String RECRT_YEAR, SCHDL_NAME;
	private Date SCHDL_START, SCHDL_END_DT;
}
