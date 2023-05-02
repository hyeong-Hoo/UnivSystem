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
            dataType : 'json',
            data: {},
            success: function(data){
            	$.each(data, function(i, list){
            		var tableList = '<tr>'
            						+ '<td>'+list.RECRT_YEAR +'</td>'
            						+ '<td>'+list.SCHDL_NAME +'</td>'
            						+ '<td><input class="day" type="date" value='+list.SCHDL_START +'></td>'
            						+ '<td><input class="day" type="date" value='+list.SCHDL_END_DT +'></td>'
            						+ '</tr>';
            						$("#tableBody").append(tableList);
            	});
            	
            }
		});
		$("#save").click(function(){
			$.ajax({
				url: '/save',
				type: 'POST',
				dataType: 'json',
			});
		});
});
</script>
<style type="text/css">
th{
text-align: center;
width: 50px;
}
th:nth-child(3){
width: 200px;
}
th:nth-child(4){
width: 200px;
}
.day{
width: 150px;
text-align: center;
}
td{
text-align: center;
}
</style>
</head>
<body>
<input type="button" value="저장" id="save">
<table id="ScheduleTable">
	<thead>
		<tr>
			<th>연도</th>
			<th>전형</th>
			<th>시작일</th>
			<th>마감일</th>
		</tr>
	</thead>
	<tbody id="tableBody">
			
	</tbody>
</table>
</body>
</html>