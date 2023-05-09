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
							    var base64str = btoa(String.fromCharCode.apply(null, new Uint8Array(info.photo_FILE)));

								var str = '<tr onmouseover="this.style.backgroundColor=\'#eee\';" onmouseout="this.style.backgroundColor=\'\';">'
								+ '<th scope="row">' + info.appl_NO
								+ '</th>' + '<td>' + info.korn_FLNM
								+ '</td>' + '<td>' + info.age + '</td>'
								+ '<td>' + info.user_BRDT + '</td>'
								+ '<td>' + info.gender_CD + '</td>'
								+ '<td>' + info.eml_ADDR + '</td>'
								+ '<td>' + info.telno + '</td>'
								+ '<td>' + info.rel_TELNO + '</td>'
								+ '<td>' + info.rel_CD + '</td>'
								+ '<td>' + info.zip + '</td>' 
								+ '<td>' + info.addr + '</td>' 
								+ '<td>' + info.daddr + '</td>' 
								+ '<td>' +'<img src="data:image/jpeg;base64,'+ base64str +'">'+ '</td>'
								
								+ '</tr>';
																			
										

								$('.table_body').append(str);
							});
						}

					});
				});
		
		$('.table_body').on('click', 'tr', function() {
			  // 클릭된 행의 각 셀 값을 가져옵니다.
			  var appl_NO = $(this).find('th').text();
			  var korn_FLNM = $(this).find('td:eq(0)').text();
			  var age = $(this).find('td:eq(1)').text();
			  var user_BRDT = $(this).find('td:eq(2)').text();
			  var gender_CD = $(this).find('td:eq(3)').text();
			  var eml_ADDR = $(this).find('td:eq(4)').text();
			  var telno = $(this).find('td:eq(5)').text();
			  var rel_TELNO = $(this).find('td:eq(6)').text();
			  var rel_CD = $(this).find('td:eq(7)').text();
			  var zip = $(this).find('td:eq(8)').text();
			  var addr = $(this).find('td:eq(9)').text();
			  var daddr = $(this).find('td:eq(10)').text();
			  var pic = $(this).find('td:eq(11)').text();

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
			  $('#pic').val(photo_FILE);
			  // 나머지 입력란에도 마찬가지로 값을 채워줍니다.
			  // ...

			});
	});
</script>
</head>
 <style>
 .col-sm-2{
 width: 10%;
 }
 </style>
<body>
	
	
     
    <div class="container">
  <h2>학생 정보</h2>
  <form>
    <div class="form-group row">
      <label for="name" class="col-sm-2 col-form-label">번호</label>
      <div class="col-sm-4">
        <input class="form-control" id="no" readonly>
      </div>
      <label for="korean-name" class="col-sm-2 col-form-label">이름</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="name2" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="department" class="col-sm-2 col-form-label">나이</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="age" readonly>
      </div>
      <label for="entrance-date" class="col-sm-2 col-form-label">생년월일</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="brdt" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="english-name" class="col-sm-2 col-form-label">성별</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="gender" readonly>
      </div>
      <label for="social-number" class="col-sm-2 col-form-label">이메일</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="email" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="grade" class="col-sm-2 col-form-label">전화번호</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="tel" readonly>
      </div>
      <label for="status" class="col-sm-2 col-form-label">비상전화번호</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="retel" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="class" class="col-sm-2 col-form-label">관계</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="who" readonly>
      </div>
      <label for="cellphone" class="col-sm-2 col-form-label">우편번호</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="zipnum" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="class" class="col-sm-2 col-form-label">주소</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="adr" readonly>
      </div>
      <label for="cellphone" class="col-sm-2 col-form-label">상세주소</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="detailadr" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="class" class="col-sm-2 col-form-label">사진</label>
      <div class="col-sm-4">
        <input type="image" class="form-control" id="pic" >
        
      </div>    
    </div>
  </form>
</div>

            
	
	<br>
	<br>
	<br>
	<br> 
	
	학생 이름:
	<input type="text" id="name">
	<button type="button" id="searchStudent">검색</button>

	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">이름</th>
				<th scope="col">나이</th>
				<th scope="col">생년월일</th>
				<th scope="col">성별</th>
				<th scope="col">이메일</th>
				<th scope="col">전화번호</th>
				<th scope="col">비상전번</th>
				<th scope="col">비상누구</th>
				<th scope="col">우편번호</th>
				<th scope="col">주소</th>
				<th scope="col">상세주소</th>
			</tr>
		</thead>
		<tbody class="table_body">
		</tbody>
	</table>
	





	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>