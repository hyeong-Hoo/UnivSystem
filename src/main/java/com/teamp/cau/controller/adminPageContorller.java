package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminPageContorller {

    @GetMapping("/admin")
    public String adminpage(){
        return "admin";
    }
}
