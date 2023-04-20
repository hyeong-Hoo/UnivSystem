package com.teamp.cau.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.teamp.cau.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	@Autowired
	private UserDetailsServiceImpl userDetailsService;
	
	
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    auth.userDetailsService(userDetailsService);
	}
	
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {	
        // 권한에 따라 허용하는 url 설정
        // /login, /signup 페이지는 모두 허용, 다른 페이지는 인증된 사용자만 허용
        http
            .authorizeRequests()
                .antMatchers("/login", "/signup" , "/findid" , "/findpass", "/resultid" ,"/resultpass", "/send"  ,"/sms/send","/First",	"/First3").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/professor/**").hasRole("PROFESSOR")
                .antMatchers("/student/**").hasRole("STUDENT")
                .antMatchers("/First2").hasRole("STUDENT") // STUDENT 권한을 가진 사용자만 First2에 접근 가능
                .anyRequest().authenticated();
        http.csrf().disable();
		// login 설정
        http
            .formLogin()
                .loginPage("/login")    // GET 요청 (login form을 보여줌)
                .loginProcessingUrl("/auth")    // POST 요청 (login 창에 입력한 데이터를 처리)
                .usernameParameter("USER_ID")	// login에 필요한 id 값을 USER_ID로 설정 (default는 username)
                .passwordParameter("PSWD")	// login에 필요한 password 값을 PSWD(default)로 설정
                .defaultSuccessUrl("/First" , true);	// login에 성공하면 /First(메인홈페이지)로 redirect
        		
		// logout 설정
        http
            .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/First");	// logout에 성공하면 /로 redirect

        return http.build();
        
    }
 }
