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
    private int USER_VALUE;
    
    public int getUSER_VALUE() {
        return USER_VALUE;
    }

    public void setUSER_VALUE(int USER_VALUE) {
        this.USER_VALUE = USER_VALUE;
    }

	


	

}