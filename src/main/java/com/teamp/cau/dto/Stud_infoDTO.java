package com.teamp.cau.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class Stud_infoDTO {
    private String eml_addr,korn_flnm,user_brdt,gender_cd,email_1,email_2,telno,rel_telno,rel_cd,zip,addr,daddr,pdf,category,Department,images;
    private MultipartFile file,image;
    private int age,stud_no;
    private double avg,korean,math,english,grade;



}
