package com.teamp.cau.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.teamp.cau.mapper.UserMapper;
import com.teamp.cau.vo.UserVo;

@Service
public class UserDetailsServiceImp implements UserDetailsService {
	

    private final UserMapper userMapper; // UserMapper is a mapper interface to get user information from DB

    public UserDetailsServiceImp(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    // Implement the loadUserByUsername method of the UserDetailsService interface.
    // This method will return a UserDetails object that contains information about the user
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // Get user information from the database using the UserMapper
        UserVo userVo = userMapper.getUserById(username);

        // If the user is not found, throw a UsernameNotFoundException
        if (userVo == null) {
            throw new UsernameNotFoundException("User not found");
        }

        // Get the user's permissions from the UserRoleEnum field and convert them to GrantedAuthority objects
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(userVo.getROLE_CODE().name()));

        // Return a new UserDetails object with the user's username, password, and permissions
        return new User(userVo.getUSER_ID(), userVo.getPSWD(), authorities);
    }
}

