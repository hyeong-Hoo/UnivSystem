<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<title>모집 일정 관리</title>
</head>
<body>
<table id="mytable">
	<thead>
		<tr>
			<th>연도</th>
			<th>전형</th>
			<th>시작일</th>
			<th>마감일</th>
		</tr>
	</thead>
	<tbody class="tablebody">
		
	</tbody>
</table>
</body>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous">
</script>
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
</html>