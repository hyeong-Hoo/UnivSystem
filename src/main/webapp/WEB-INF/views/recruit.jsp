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
<title>모집인원관리</title>
<script type="text/javascript">
$(function(){
	$("#recruitCheck").click(function(){
		
		var year = $("#recuitYear").val();
		var depart = $("#depart").val();
		var category = $("#category").val();
		$.ajax({
			url : '/check',
			type : 'GET',
			datatype : 'json',
			data : {year : year, depart : depart, category : category},
			success: function(data){
				if($("#recruitBody").children().length){
					$("#recruitBody").empty();
				}
				$.each(data,function(i, list){
				var tableList = '<tr>'
								+ '<td>'+list.SCHDL_NAME+'</td>'
								+ '<td>'+list.DEPARTMENT+'</td>'
								+ '<td><input class="applNum" type="Number" value='+list.APPL_NUM+'></td>'
								+ '<td></td>'
								+ '<td></td>'
								+ '<td></td>';
								$("#recruitBody").append(tableList);
					
				});
		}

	});

});
	$("#recruitSave").click(function(){
		
		
	});
});
</script>
<style type="text/css">
body{
margin: 0;
padding: 0;
}
.applNum{
text-align:center;
border: none;
width: 50px;
}
input[type='number']::-webkit-outer-spin-button,
input[type='number']::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
}
.box{
background-color: white;
width: 100%;
height: 100vh;
}
.select_box{
width: inherit;
height: 40px;
line-height: 40px;
text-align: center;
}
.btn{
margin: 5px 10px 0 0;
float: right;
width:60px;
height:30px;
background-color:silver;
text-align: center;
line-height: 20px;
font-size: 15px;
}
.select{
float:left;
margin: 6px 0 0 5px;
}
.num{
width:100px;
}
.recruitTable{
text-align: center;
border-collapse: collapse;
width : 750px;
border: 1px solid silver;
}
.recruitTable>tbody>tr>td{
height : 25px;
font-size: 15px;
border: 1px solid silver;
text-align: center;
}
.recruitTable>thead>tr>th{
text-align: center;
width: 50px;
height: 30px;
border-right: 1px solid silver;
}

</style>

</head>
<body>
<span>모집 인원 관리</span>
<div class="box">
	<div class="select_box">
		<select class="select" id="recuitYear">
		<c:forEach items="${year }" var="y">
			<option>${y.RECRT_YEAR}</option>
		</c:forEach>
		</select>
		<select class="select" id="depart">
			<option value="all">학과 선택</option>
		<c:forEach items="${depart }" var="d">
			<option>${d.DEPARTMENT}</option>
		</c:forEach>
		</select>
		<select class="select" id="category">
			<option value="1">정시</option>
			<option value="2">수시</option>
		</select>
		<button type="button" class="btn" id="recruitSave">저장</button>
		<button type="button" class="btn" id="recruitCheck">조회</button>
	</div>
	<div>
		<table class="recruitTable">
			<thead>
				<tr>
					<th>전형</th>
					<th>학과</th>
					<th>입학정원</th>
					<th>최초인원</th>
					<th>합격인원</th>
					<th>예비인원</th>
				</tr>
			</thead>
			<tbody id="recruitBody">
			</tbody>
		</table>
	</div>
</div>

</body>
<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"></script>
</html>