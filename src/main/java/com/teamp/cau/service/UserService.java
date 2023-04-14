package com.teamp.cau.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.teamp.cau.mapper.UserMapper;
import com.teamp.cau.vo.UserVo;



@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public List<UserVo> getUserList() {
        return userMapper.getUserList();
    }

    public UserVo getUserById(Long id) {
        return userMapper.getUserById(id);
    }

    public UserVo getUserByEmail(String email) {
        return userMapper.getUserByEmail(email);
    }

    public void signup(UserVo userVo) { // 회원 가입
        if (!userVo.getUsername().equals("") && !userVo.getEmail().equals("")) {
		    // password는 암호화해서 DB에 저장           
            userVo.setPassword(passwordEncoder.encode(userVo.getPassword()));
            userMapper.insertUser(userVo);
        }
    }

    public void edit(UserVo userVo) { // 회원 정보 수정
 		// password는 암호화해서 DB에 저장      
        userVo.setPassword(passwordEncoder.encode(userVo.getPassword()));
        userMapper.updateUser(userVo);
    }

    public void withdraw(Long id) { // 회원 탈퇴
        userMapper.deleteUser(id);
    }

    public PasswordEncoder passwordEncoder() {
        return this.passwordEncoder;
    }
    
    
    
    public String findEmailByNameAndPhone(String name, String phone) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("name", name);
        paramMap.put("phone", phone);
        UserVo findid = userMapper.findEmailByNameAndPhone(paramMap);
        if (findid == null) {
            return null;
        }
        return findid.getEmail();
    }
    
    
    public String findPassword(String email, String name, String phone) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("email", email);
        paramMap.put("name", name);
        paramMap.put("phone", phone);
        UserVo findpass = userMapper.findPassword(paramMap);
        if (findpass == null) {
            return null;
        }
        return findpass.getPassword();
    }
    
}