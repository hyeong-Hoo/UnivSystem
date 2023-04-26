package com.teamp.cau.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.teamp.cau.dto.MessageDTO;
import com.teamp.cau.dto.SmsResponseDTO;
import com.teamp.cau.service.SmsService;
import com.teamp.cau.service.UserService;
import com.teamp.cau.vo.UserVo;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class UserController {
   
	@Autowired
    private UserService userService;
    private final SmsService smsService;
    
    
    @GetMapping("/")
    public String home(Model model) { // 인증된 사용자의 정보를 보여줌
        Long id = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        // token에 저장되어 있는 인증된 사용자의 id 값
        
        UserVo userVo = userService.getUserByNo(id);
        userVo.setPSWD(null); // password는 보이지 않도록 null로 설정
        model.addAttribute("user", userVo);

        return "home";
    }
    
   
    @GetMapping("/userList")
    public String getUserList(Model model) { // User 테이블의 전체 정보를 보여줌
        List<UserVo> userList = userService.getUserList();
        model.addAttribute("list", userList);
        return "userListPage";
    }

    @GetMapping("/login")
    public String loginPage() { // 로그인되지 않은 상태이면 로그인 페이지를, 로그인된 상태이면 First 페이지를 보여줌
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken)
            return "loginPage";
        return "redirect:/";
    }

    @GetMapping("/update")
    public String editPage(Model model) { // 회원 정보 수정 페이지
        Long USER_NO = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserVo userVo = userService.getUserByNo(USER_NO);
        model.addAttribute("user", userVo);
        return "editPage";
    }

    @PostMapping("/update")
    public String edit(UserVo userVo) { // 회원 정보 수정
        Long USER_NO = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        userVo.setUSER_NO(USER_NO);
        userService.edit(userVo);
        return "redirect:/";
    }
    
    @GetMapping("/findid")
    public String findid() {   //아이디 찾기 페이지
        return "findid";
    }
    
    
    @PostMapping("/findid")	//아이디 찾기
    public String findIdByNameAndTel(@RequestParam String KORN_FLNM, @RequestParam String TELNO, Model model) {
        String USER_ID = userService.findIdByNameAndTel(KORN_FLNM, TELNO);
        if (USER_ID == null) {
            model.addAttribute("error", "User not found");
            return "error";
        }
        model.addAttribute("USER_ID", USER_ID);
        return "resultid";
    }
    
    @GetMapping("/findpass")	// 비밀번호 찾기 페이지
    public String findpass() {  
        return "findpass";
    }

    @PostMapping("/findpass")	// 비밀번호 찾기
    public String findPass(@RequestParam String USER_ID, @RequestParam String KORN_FLNM, @RequestParam String TELNO, @RequestParam(required = false) boolean sms, Model model) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
        String tempPassword = userService.resetPassword(USER_ID, KORN_FLNM, TELNO);
        if (tempPassword == null) {
            model.addAttribute("error", "User not found");
            return "error";
        }
        
        // SMS 발송을 선택한 경우
        if (sms) {
            MessageDTO messageDto = new MessageDTO();
            messageDto.setTo(TELNO);
            messageDto.setContent("임시 비밀번호는 " + tempPassword + "입니다.");
            SmsResponseDTO response = smsService.sendSms(messageDto);
            model.addAttribute("response", response);
        }
        
        model.addAttribute("tempPassword", tempPassword);
        return "resultpass";
    }
    /*
    @GetMapping("/signup")
    public String signupPage() {  // 회원 가입 페이지
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken)
            return "signupPage";
        return "redirect:/";
    }

   @PostMapping("/signup")
    public String signup(UserVo userVo) { // 회원 가입
        try {
            userService.signup(userVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/login";
    }

    @PostMapping("/delete")
    public String withdraw(HttpSession session) { // 회원 탈퇴
        Long USER_NO = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (USER_NO != null) {
            userService.withdraw(USER_NO);
        }
        SecurityContextHolder.clearContext(); // SecurityContextHolder에 남아있는 token 삭제
        return "redirect:/";
    }
*/
    
}