package com.teamp.cau.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamp.cau.vo.UserVo;

@Mapper
public interface UserMapper {
    List<UserVo> getUserList(); // User 테이블 가져오기
    void insertUser(UserVo userVo); // 회원 가입
    UserVo getUserByEmail(String email); // 회원 정보 가져오기
    UserVo getUserById(Long id);
    void updateUser(UserVo userVo); // 회원 정보 수정
    void deleteUser(Long id); // 회원 탈퇴
    UserVo findEmailByNameAndPhone(Map<String, Object> paramMap);
    UserVo findPassword(Map<String, Object> paramMap);
}