package com.teamp.cau.dto;

import lombok.Data;

@Data
public class AssessmentDTO {
	
	private int STUD_NO, math, english, avg;
	private boolean passed, evee;

}
