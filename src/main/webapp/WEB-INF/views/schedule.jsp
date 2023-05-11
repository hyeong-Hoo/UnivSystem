<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<title>모집 일정 관리</title>
<script type="text/javascript">
$(function(){
	var date = new Date();
	var year = date.getFullYear();
		$.ajax({
			url: '/sch',
            type: 'GET',
            dataType : 'json',
            data: {},
            success: function(data){
            	$.each(data, function(i, list){
            		var check = list.RECRT_YEAR != year ? 'disabled' : '';
            		var tableList = '<tr>'
            						+ '<td class="scheduleYear">'+list.RECRT_YEAR +'</td>'
            						+ '<td>'+list.SCHDL_NAME +'</td>'
            						+ '<td><input class="day start" type="date" value='+list.SCHDL_START +' '+check + '></td>'
            						+ '<td><input class="day end" type="date" value='+list.SCHDL_END_DT +' '+check + ' min='+list.SCHDL_START+'></td>'
            						+ '<input class="recCD" type="hidden" value='+list.RECRT_SCHDL_CD + '>'
            						+ '</tr>';
             						$("#scheduleBody").append(tableList);
            						
            	});
            }
		});
		$("#scheduleCheck").click(function(){
			var year = $("#scheduleYear").val();
			var date = new Date();
			var nowYear = date.getFullYear();
			$.ajax({
				url: '/scheduleCheck',
				type: 'GET',
				dataType: 'json',
				data: {year : year},
				success: function(data){
					$("#scheduleBody").empty();
					$.each(data, function(i, list){
						var check = list.RECRT_YEAR != nowYear ? 'disabled' : '';
	            		var tableList = '<tr>'
	            						+ '<td class="scheduleYear">'+list.RECRT_YEAR +'</td>'
	            						+ '<td>'+list.SCHDL_NAME +'</td>'
	            						+ '<td><input class="day start" type="date" value='+list.SCHDL_START +' '+check + '></td>'
	            						+ '<td><input class="day end" type="date" value='+list.SCHDL_END_DT +' '+check + ' min='+list.SCHDL_START+ '></td>'
	            						+ '<input class="recCD" type="hidden" value='+list.RECRT_SCHDL_CD + '>'
	            						+ '</tr>';
	             						$("#scheduleBody").append(tableList);
					});
					
				}
			});
		});
 		$("#scheduleSave").click(function(){
 			var date = new Date();
 			var year = date.getFullYear();
 			var length = $("#scheduleBody").children().length;
 			var schArray = new Array();
			var num = 0;
			if(confirm("저장하시겠습니까?")){
 			if($("#scheduleBody").children().length){
 				for(var i=0; i < length; i++){
 					if($("#scheduleBody").children().eq(i).children(".scheduleYear").text() == year){
 						var recCD = $("#scheduleBody").children().eq(i).find(".recCD").val();
 						var start = $("#scheduleBody").children().eq(i).find(".start").val();
 						var end = $("#scheduleBody").children().eq(i).find(".end").val();
 						num = num+1;
 						schArray[i] = {"recCD" : recCD, "start" : start, "end" : end, "year" : year};
 					}else{
 						break;
 					}
 				}
 				$.ajax({
 					url: 'ScheduleSave',
 					type: 'POST',
 					cache: false,
 					data: {"schArray" : schArray, "num" : num},
 					success:function(){
 						alert("저장이 완료되었습니다.");
 					}
 				});
 			}else{
 				
 			}
 		}
 	});
 		$(document).on("change",".start",function(){
 			var start = $(this).val();
 			$(this).parent().parent().find('.end').val(start);
 			$(this).parent().parent().find('.end').attr('min',start);
 			
 		})
});
</script>
<style type="text/css">
.schedule{
width: 450px;
float: left;
margin: 0 25px 0 15px; 
}
.recruit{
width: 750px;
float:left;
}
.selectbox{
width: 450px;
height: 40px;
text-align: center;
line-height: 40px;
}
.select{
float: left;
margin-top: 10px;
}
.btn{
margin-top: 5px;
float: right;
width:60px;
height:30px;
background-color:silver;
text-align: center;
line-height: 20px;
font-size: 15px;
}
.scheduleTable{
text-align: center;
border-collapse: collapse;
width : 450px;
border: 1px solid silver;
}
.scheduleTable>tbody>tr>td{
height : 25px;
font-size: 15px;
border: 1px solid silver;
text-align: center;
}
.day{
width: 130px;
text-align: center;
border: none;
}
.scheduleTable>thead>tr>th{
text-align: center;
width: 50px;
height: 30px;
border-right: 1px solid silver;
}
.scheduleTable>thead>tr>th:nth-child(3){
width: 130px;
}
.scheduleTable>thead>tr>th:nth-child(4){
width: 130px;
border: none;
}

.recbox{
width: 100%;
}
</style>
</head>
<body>
<div class="recbox">
<div class="schedule">
<span class="text">모집 일시 관리</span>
<div class="selectbox">
<select class="select" id="scheduleYear">
		<option value="all">연도 선택</option>
	<c:forEach items="${year }" var="y">
		<option>${y.RECRT_YEAR}</option>
	</c:forEach>
</select>
<input type="button" value="저장" class="btn" id="scheduleSave">
<input type="button" value="조회" class="btn save" id="scheduleCheck">
</div>
<table class="table" id="dataTable">
	<thead>
		<tr>
			<th>연도</th>
			<th>전형</th>
			<th>시작일</th>
			<th>마감일</th>
		</tr>
	</thead>
	<tbody id="scheduleBody">
			
	</tbody>
</table>
</div>
<div class="recruit">
<%@ include file="recruit.jsp" %>
</div>
</div>
</body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</html>