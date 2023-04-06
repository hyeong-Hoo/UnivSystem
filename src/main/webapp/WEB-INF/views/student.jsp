<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인신상조회</title>
</head>
<body>
<c:forEach items="${student }" var="stu">
학번(이름) <input value="${stu.KORN_FLNM }"><button></button> 과정구분 <input value="${stu.USER_BRDT }"> <br>
한글(한문) <input value="${stu.AGE }"> 소속학과 <input> 입학일자 <input> <br>
이름(영문) <input> 학년 <input> <br>
주민번호 <input> 학적상태 <input> 분반 <input> <br>
휴대전화 <input> 최종변동상태 <input>  <br>
전화번호 <input> 졸업일자 <input> <br>
지도교수 <input>  <br>
</c:forEach>

						
</body>
</html>