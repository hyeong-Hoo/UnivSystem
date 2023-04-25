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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function popup(){
		  window.open("localhost/${pdf}","_blank", 'width=1000px,height=1000px,scrollbars=yes');
		}	
$(function(){
	$('#searchStudent').click(function() {
				  $("input:checkbox[id='check_all']").prop("checked", false);
				$.ajax({
					url : '/passInfo',
					type : 'GET',
					data : {
						"KORN_FLNM" : $('#name').val(),"department" : $('#department').val(), "category":$('#category').val()},
					dataType : "json",
					success : function(data) {
						$('.table_body').empty(); // 기존 테이블 데이터를 지웁니다.
						$('#no').val('');
						  $('#name2').val('');
						  $('#age').val('');
						  $('#brdt').val('');
						  $('#gender').val('');
						  $('#email').val('');
						  $('#tel').val('');
						  $('#retel').val('');
						  $('#avg').val('');
						  $('#zipnum').val('');
						  $('#adr').val('');
						  $('#detailadr').val('');
						  $('#PDF').val('');
						  $('#PASS_INFO').val('');
					

						$.each(data, function(i, info) {
							var selectid="creditSelect"+info.pass_INFO;
							var str = '<tr onmouseover="this.style.backgroundColor=\'#eee\';" onmouseout="this.style.backgroundColor=\'\';">'
							+ '<td scope="row" class="checkbox_i"> <input type="checkbox" class="checkbox_a" name="checkbox_c"></td>' 
							if(i<=30){str += '<td class="passrank">' + (i+1)	+ '번</td>' ;}
							else{str += '<td class="passrank">예비' + i-29	+ '번</td>' ;}
						 	str += '<td class="button_name">' + info.appl_NO	+ '</td>' 
							+ '<td class="name_m">' + info.korn_FLNM + '</td>' 
							+ '<td>' + info.age + '</td>'
							+ '<td>' + info.user_BRDT + '</td>'
							+ '<td>' + info.gender_CD + '</td>'
							+ '<td>' + info.eml_ADDR + '</td>'
							+ '<td class="telno_m">' + info.telno + '</td>'
							+ '<td>' + info.rel_TELNO + '</td>'
							+ '<td>' + info.avg + '</td>'
							+ '<td class="find_Select"> <select id='+selectid+' class="creditSelect"><option value=0>문자대기</option><option value=1>예치금 대기</option><option value=2>합격</option><option value=3>합격의지없음</option><option value=4>예치금반환(환불)</option></select></td>'
							+'<td> <input type="button" class="button_save" value="저장하기"></td></tr>';
							$('.table_body').append(str);
							$('#'+selectid).val(info.pass_INFO).attr("selected", "selected");
						});
					}

				});
			});
	

	$('.permit1').click(function() {
	    var checkBoxArr = new Array(); 
		var num=0;
	  $("input:checkbox[name='checkbox_c']:checked").each(function(i) {
	 	 var name_m = $(this).closest('tr').find('.name_m').text();
	 	 var telno_m = $(this).closest('tr').find('.telno_m').text();
	 	 var passrank = $(this).closest('tr').find('.passrank').text();

		num=num+1;
	  	checkBoxArr[i] = {"no" : i, "name_m" : name_m, "telno_m":telno_m,"passrank":passrank}
	});
	alert(checkBoxArr);
	  $.ajax({
			url : "/permit1",
			type : "post",
			cache : false,
	      	data: { "checkBoxArr" : checkBoxArr ,"num" : num }      // folder seq 값을 가지고 있음.
	   });
	});
	$('.permit2').click(function() {
	    var checkBoxArr = new Array(); 
		var num=0;
	  $("input:checkbox[name='checkbox_c']:checked").each(function(i) {
	 	 var name_m = $(this).closest('tr').find('.name_m').text();
	 	 var telno_m = $(this).closest('tr').find('.telno_m').text();
		num=num+1;
	  	checkBoxArr[i] = {"no" : i, "name_m" : name_m, "telno_m":telno_m}
	});
	alert(checkBoxArr);
	  $.ajax({
			url : "/permit1",
			type : "post",
			cache : false,
	      	data: { "checkBoxArr" : checkBoxArr ,"num" : num }      // folder seq 값을 가지고 있음.
	   });
	});
		$(document)	.on("click",".button_save",	function() {
							var find = $(this).parent().prevAll(".find_Select")
									.children(".creditSelect").val();
							var state = $(this).parent()
									.prevAll(".button_name").text();
							var creditSelect = $(this).parent().prevAll(
									".creditSelect");
							$.ajax({
								url : '/passUpdate',
								type : 'POST',
								data : {
									"appl_NO" : state,
									"PASS_INFO" : find
								},
								dataType : "html",
								success : function(active) {
									active
									if (active == "0") {
										alert("문자대기로 변경");
									} else if (active == "1") {
										alert("예치금 대기로변경");

									} else if (active == "2") {
										alert("합격으로 변경");

									} else if (active == "3") {
										alert("합격의지없음으로 변경");

									} else if (active == "4") {
										alert("예치금반환(환불)로 변경");
									}
								}
							});
						});

		$('.table_body').on('click', 'tr', function() {
			// 클릭된 행의 각 셀 값을 가져옵니다.
			var appl_NO = $(this).find('td:eq(2)').text();
			var korn_FLNM = $(this).find('td:eq(3)').text();
			var age = $(this).find('td:eq(4)').text();
			var user_BRDT = $(this).find('td:eq(5)').text();
			var gender_CD = $(this).find('td:eq(6)').text();
			var eml_ADDR = $(this).find('td:eq(7)').text();
			var telno = $(this).find('td:eq(8)').text();
			var rel_TELNO = $(this).find('td:eq(9))').text();
			var avg = $(this).find('td:eq(10)').text();
			var PASS_INFO = $(this).find('td:eq(11)').text();

			// 입력란에 값을 채웁니다.

			$('#no').val(appl_NO);
			$('#name2').val(korn_FLNM);
			$('#age').val(age);
			$('#brdt').val(user_BRDT);
			$('#gender').val(gender_CD);
			$('#email').val(eml_ADDR);
			$('#tel').val(telno);
			$('#retel').val(rel_TELNO);
			$('#avg').val(avg);
			$('#PASS_INFO').val(PASS_INFO);
			// 나머지 입력란에도 마찬가지로 값을 채워줍니다.
			// ...

		});
		$(document).on('click','#check_all',function(){
			  if($('#check_all').is(':checked')){
			       $('.checkbox_a').prop('checked',true);
			    }else{
			       $('.checkbox_a').prop('checked',false);
			    }
		});
		$(document).on('click','.checkbox_a',function(){
		    if($('input[class=checkbox_a]:checked').length==$('.checkbox_a').length){
		        $('#check_all').prop('checked',true);
		    }else{
		       $('#check_all').prop('checked',false);
		    }
		});
	});
</script>
</head>
<style>
.col-sm-2 {
	width: 10%;
}
.scroll{
div:100%;
height:600px;
overflow: scroll;
}
.text_right{
text-align: right;
}
</style>
<body>
	<div class="row">
		<div class="col-sm-12 col-md-6">
			<div class="dataTables_length" id="dataTable_length">
				<label>지원 학과 
				<select 	class="custom-select custom-select-sm form-control form-control-sm" id="department">
						<c:forEach  items="${list_d}" var="d">
						<option>${d.department }</option>
						</c:forEach>
				</select>
				</label> <label>지원 전형<select
					class="custom-select custom-select-sm form-control form-control-sm" id="category">
						<c:forEach  items="${list_c}" var="c">
						<option>${c.category }</option>
						</c:forEach>
				</select>
				</label>
			</div>
		</div>
		<div class="col-sm-12 col-md-6">
			<div id="dataTable_filter" class="dataTables_filter text_right">
				<label> 학생 이름: <input type="text" id="name">
					<button type="button" id="searchStudent">검색</button>
				</label>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br> 
<div class="scroll">
	<table class="table">
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" id="check_all"></th>
				<th scope="col">성적순번</th>
				<th scope="col">지원서번호</th>
				<th scope="col">이름</th>
				<th scope="col">나이</th>
				<th scope="col">생년월일</th>
				<th scope="col">성별</th>
				<th scope="col">이메일</th>
				<th scope="col">전화번호</th>
				<th scope="col">비상연락처</th>
				<th scope="col">평균점수</th>
				<th scope="col">합격여부</th>
				<th scope="col">저장하기</th>
			</tr>
		</thead>
		<tbody class="table_body">
		</tbody>
		<input type="button" class="permit1" value="예비번호 문자보내기"> <br>
		<input type="button" class="permit2" value="계좌번호 문자보내기"> 
	</table>
</div>





	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>