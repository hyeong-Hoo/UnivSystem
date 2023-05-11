<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인신상조회</title>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$('#searchStudent').click(
				function() {
					$.ajax({
						url : '/info',
						type : 'GET',
						data : {
							"KORN_FLNM" : $('#name').val()
						},
						dataType : "json",
						success : function(data) {
							
							  $('.table_body').empty(); // 기존 테이블 데이터를 지웁니다.
							  $('#no').val('');
							  $('#name2').val('');
							  $('#age').val('');
							  $('#brdt').val('');
							  $('#pic').val('');
							  $('#gender').val('');
							  $('#email').val('');
							  $('#tel').val('');
							  $('#retel').val('');
							  $('#who').val('');
							  $('#zipnum').val('');
							  $('#adr').val('');
							  $('#detailadr').val('');

							$.each(data, function(i, info) {

								var str = '<tr onmouseover="this.style.backgroundColor=\'#eee\';" onmouseout="this.style.backgroundColor=\'\';">'
								+ '<th scope="row" class="aplyno">' + info.appl_NO	+ '</th>' 
								+ '<td class="korname">' + info.korn_FLNM + '</td>' 
								+ '<td class="korage">' + info.age + '</td>'
								+ '<td class="korbrdt">' + info.user_BRDT + '</td>'
								+ '<td class="korgender">' + info.gender_CD + '</td>'
								+ '<td class="koremail">' + info.eml_ADDR + '</td>'
								+ '<td class="kortelno">' + info.telno + '</td>'
								+ '<td class="korrelno">' + info.rel_TELNO + '</td>'
								+ '<td class="korrelcd" style="display:none;">' + info.rel_CD + '</td>'
								+ '<td class="korzip" style="display:none;">' + info.zip + '</td>' 
								+ '<td class="koradr" style="display:none;">' + info.addr + '</td>' 
								+ '<td class="kordar" style="display:none;">' + info.daddr + '</td>' 
								+ '<td class="photofile" style="display:none;">' + info.photo_FILE + '</td>'								
								+ '</tr>';
																	
										
								$('.table_body').append(str);
														
							
							});
							
						}

					});
				});
		
		$('.table_body').on('click', 'tr', function() {
			  // 클릭된 행의 각 셀 값을 가져옵니다.
			  var appl_NO = $(this).find('.aplyno').text();
			  var korn_FLNM = $(this).find('.korname').text();
			  var age = $(this).find('.korage').text();
			  var user_BRDT = $(this).find('.korbrdt').text();
			  var gender_CD = $(this).find('.korgender').text();
			  var eml_ADDR = $(this).find('.koremail').text();
			  var telno = $(this).find('.kortelno').text();
			  var rel_TELNO = $(this).find('.korrelno').text();
			  var rel_CD = $(this).find('.korrelcd').text();
			  var zip = $(this).find('.korzip').text();
			  var addr = $(this).find('.koradr').text();
			  var daddr = $(this).find('.kordar').text();
			  var pic = $(this).find('.photofile').text();
			  var imgTag = '<img src="data:image/jpeg;base64,' + pic + '" />';
			  $('#pic').html(imgTag);	

			  // 입력란에 값을 채웁니다.
			  
			  $('#no').val(appl_NO);
			  $('#name2').val(korn_FLNM);
			  $('#age').val(age);
			  $('#brdt').val(user_BRDT);
			  $('#gender').val(gender_CD);
			  $('#email').val(eml_ADDR);
			  $('#tel').val(telno);
			  $('#retel').val(rel_TELNO);
			  $('#who').val(rel_CD);
			  $('#zipnum').val(zip);
			  $('#adr').val(addr);
			  $('#detailadr').val(daddr);
			  
			  // 나머지 입력란에도 마찬가지로 값을 채워줍니다.
		
			});
	});
</script>
</head>
 <style>
 .col-sm-2{
 width: 10%;
 }
 .pic {
 width: 200px;
 height: 200px;
 border: solid black 1px;
 }
 .pic > img{
 width: 200px;
 height: 200px;
 border: solid black 1px;
 }
 .allbox{

 width:100%;
 height: 500px;
 margin: 0 auto;
 border: solid black 1px;
 padding: 10px;
 
 
 }
 .box1{
 width:100%;
 
 height: 220px;
 }
 .pic{
 float:left;
 width:200px;
 height: 200px;
 }
 .box2{
 width:100%;
 
 height: 250px;
 }
 
.scroll{
div:100%;
height:300px;
overflow: scroll;
}
 </style>
<body>
	
	
     
   <div class="container">
<br>  
  <form>
       
     <div class="allbox">
     <div class="box1">
     <div id="pic" class="pic">
    
     </div>
 
    <div class="row mb-3">
  	<label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm ">번호</label>
  	<div class="col-sm-9">
    <input type="text" class="form-control" id="no" readonly>
    </div>
    </div>
    
    <div class="row mb-3">
  	<label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">이름</label>
  	<div class="col-sm-9">
    <input type="text" class="form-control" id="name2" readonly>
    </div>
    </div>
    
    <div class="row mb-3">
  	<label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">나이</label>
  	<div class="col-sm-9">
    <input type="text" class="form-control" id="age" readonly>
    </div>
    </div>
    
    <div class="row mb-3">
  	<label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm ">생년월일</label>
  	<div class="col-sm-9">
    <input type="text" class="form-control" id="brdt" readonly>
    </div>
    </div>
      
    </div>
    
    <div class="box2">
     
 <div class="form-group row mb-3">
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">성별</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="gender" readonly>
  </div>
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">이메일</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="email" readonly>
  </div>
</div>

<div class="form-group row mb-3">
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">생년월일</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="brdt" readonly>
  </div>
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">전화번호</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="tel" readonly>
  </div>
</div>

<div class="form-group row mb-3">
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">비상전화번호</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="retel" readonly>
  </div>
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">관계</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="who" readonly>
  </div>
</div>

<div class="form-group row mb-3">
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">우편번호</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="zipnum" readonly>
  </div>
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">주소</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="adr" readonly>
  </div>
</div>

<div class="form-group row mb-3">
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">상세주소</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="detailadr" readonly>
  </div>
  <label for="colFormLabel" class="col-sm-2 col-form-label col-form-label-sm">학과</label>
  <div class="col-sm-4">
    <input type="text" class="form-control" id="adr" readonly>
  </div>
</div>
  
      
    
    </div>
    </div>        
    </form>
    </div>
    
  
      
	
	
	<br>
	<br> 
	
	학생 이름
	<input type="text" id="name">
	<button type="button" id="searchStudent">검색</button>
	<div class="scroll">
	
	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">이름</th>
				<th scope="col">나이</th>
				<th scope="col">생년월일</th>
				<th scope="col" >성별</th>
				<th scope="col" style= display:none;>이메일</th>
				<th scope="col" style= display:none;>전화번호</th>
				<th scope="col" style= display:none;>비상전번</th>
				<th scope="col" style= display:none;>비상누구</th>
				<th scope="col" style= display:none;>우편번호</th>
				<th scope="col" style= display:none;>주소</th>
				<th scope="col" style= display:none;>상세주소</th>
			</tr>
		</thead>
		<tbody class="table_body">
		</tbody>
	</table>
	</div>





	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>