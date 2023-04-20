package com.teamp.cau.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
@Getter
@Setter
public class User implements UserDetails {
private Long USER_NO;
private String USER_ID;
private String PSWD;
private Collection<? extends GrantedAuthority> authorities;
public User(Long USER_NO, String USER_ID, String PSWD, int USER_VALUE) {
    this.USER_NO = USER_NO;
    this.USER_ID = USER_ID;
    this.PSWD = PSWD;

    // USER_VALUE에 따라 권한을 설정합니다.
    List<GrantedAuthority> authorities = new ArrayList<>();
    if (USER_VALUE == 1) {
        authorities.add(new SimpleGrantedAuthority("ROLE_STUDENT"));
    } else if (USER_VALUE == 2) {
        authorities.add(new SimpleGrantedAuthority("ROLE_PROFESSOR"));
    } else if (USER_VALUE == 3) {
        authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
    }
    this.authorities = authorities;
}

@Override
public Collection<? extends GrantedAuthority> getAuthorities() {
    return authorities;
}

@Override
public String getPassword() {
    return PSWD;
}

@Override
public String getUsername() {
    return USER_ID;
}

// 다음 메서드들은 사용하지 않으므로 모두 true를 반환합니다.
@Override
public boolean isAccountNonExpired() {
    return true;
}

@Override
public boolean isAccountNonLocked() {
    return true;
}

@Override
public boolean isCredentialsNonExpired() {
    return true;
}

@Override
public boolean isEnabled() {
    return true;
}
}
