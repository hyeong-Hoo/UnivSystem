package com.teamp.cau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class entranceController {

	@GetMapping("/ent_standard")
	public String standard() {
		
		return "ent_standard";
	}
	
	@GetMapping("/ent_highschool")
	public String highschool() {
		
		return "ent_highschool";
	}
	
	@GetMapping("/ent_grade")
	public String grade() {
		
		return "ent_grade";
	}
	
	@GetMapping("/ent_guideline")
	public String guideline() {
		
		return "ent_guideline";
	}
	
	@GetMapping("/ent_selection")
	public String selection() {
		
		return "ent_selection";
	}
	
	@GetMapping("/ent_application")
	public String application() {
		
		return "ent_application";
	}
	
	@GetMapping("/ent_student")
	public String student() {
		
		return "ent_student";
	}
	
	@GetMapping("/ent_volunteer")
	public String volunteer() {
		
		return "ent_volunteer";
	}
	
	@GetMapping("/ent_schoolgrade")
	public String schoolgrade() {
		
		return "ent_schoolgrade";
	}
	
	@GetMapping("/ent_SATscore")
	public String SATscore() {
		
		return "ent_SATscore";
	}
	
	@GetMapping("/ent_prize")
	public String prize() {
		
		return "ent_prize";
	}
	
	@GetMapping("/ent_admission")
	public String admission() {
		
		return "ent_admission";
	}
	
	@GetMapping("/ent_memberpass")
	public String memberpass() {
		
		return "ent_memberpass";
	}
	
	@GetMapping("/ent_acceptance")
	public String acceptance() {
		
		return "ent_acceptance";
	}
	
	@GetMapping("/ent_freshman")
	public String freshman() {
		
		return "ent_freshman";
	}

}
