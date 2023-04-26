<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<html>
<head>
<meta charset="UTF-8">
<title>pass</title>
</head>
<body>
<%--<div>password: ${password}</div> --%>
    <div>임시 비밀번호 : ${tempPassword}</div>
   <button type="button" onclick="location.href='/'">돌아가기</button>
    
</body>
</html>