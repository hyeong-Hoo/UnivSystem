package com.teamp.cau.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


import com.teamp.cau.mapper.UserMapper;
import com.teamp.cau.util.User;
import com.teamp.cau.vo.UserVo;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    UserVo userVo = userMapper.getUserById(username);
	    if (userVo == null) {
	        throw new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다.");
	    }
	    return new User(userVo.getUSER_NO(), userVo.getUSER_ID(), userVo.getPSWD(), userVo.getUSER_VALUE());
	}

}
