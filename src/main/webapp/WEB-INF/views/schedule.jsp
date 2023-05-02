<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<title>모집 일정 관리</title>
<script type="text/javascript">
$(document).ready(function(){
		$.ajax({
			url: '/sch',
            type: 'GET',
            data: {},
            success: function(){
            	
            }
		});
});
</script>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>연도</th>
			<th>전형</th>
			<th>시작일</th>
			<th>마감일</th>
		</tr>
	</thead>
	<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
	</tbody>
</table>
</body>
</html>