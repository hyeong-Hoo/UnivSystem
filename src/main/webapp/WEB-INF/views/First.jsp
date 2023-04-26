<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대학교메인페이지</title>
</head>
<body>
대학교메인페이지 입니다



<% if (request.getUserPrincipal() == null) { %>
로그인
    <!-- 로그인 버튼 -->
    <button type="button" onclick="location.href='loginPage'">로그인페이지</button>
<% } else { %>
    <!-- 로그아웃 버튼 -->
    <form action="/logout" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">로그아웃</button>
    </form>
<% } %>

<br><br><br>





학사관리 페이지
<button type="button" onclick="location.href='First3'"> 학사관리페이지로이동</button>
<br><br><br>



학교소개
<button type="button" onclick="location.href='First2'">학교소개로 이동</button>
<br><br><br>

</body>
</html>