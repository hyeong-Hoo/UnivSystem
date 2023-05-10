package com.teamp.cau.vo;

import lombok.Data;

@Data
public class UserVo {
    private Long USER_NO;
    private String USER_ID;
    private String PSWD;
    private String KORN_FLNM;
    private String USER_BRDT;
    private String EML_ADDR;
    private String TELNO;
    private String PSWD_CHG_YN;
    private String PSWD_CHG_DT;
    private int PSWD_ERR_NMTM;
    private UserRoleEnum ROLE_CODE; 
    private Integer STUD_NO; 
    private Integer INSTR_NO;
    public enum UserRoleEnum {
        STUDENT, PROFESSOR, ADMIN;

    }
		
}