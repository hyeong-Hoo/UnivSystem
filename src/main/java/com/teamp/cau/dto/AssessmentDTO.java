package com.teamp.cau.dto;

import lombok.Data;

@Data
public class AssessmentDTO {
	
	private int stud_NO, math, english, avg;
	private String category;
	private boolean passed, evee;

}
