<<<<<<< HEAD
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
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   function popup(){
        window.open("localhost/${pdf}","_blank", 'width=1000px,height=1000px,scrollbars=yes');
      }
   $(function(){
   $('#button_save').click(function (){
      })   
   }); 
$(function(){
   $('#searchStudent').click(function() {
            $.ajax({
               url : '/passInfo',
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
                    $('#gender').val('');
                    $('#email').val('');
                    $('#tel').val('');
                    $('#retel').val('');
                    $('#who').val('');
                    $('#zipnum').val('');
                    $('#adr').val('');
                    $('#detailadr').val('');
                    $('#PDF').val('');
                    $('#PASS_INFO').val('');
               

                  $.each(data, function(i, info) {
                     var pass_state="abc";
                     if(info.pass_INFO==0){pass_state="문자대기"}
                     else if(info.pass_INFO==1){pass_state="예치금 대기"}
                     else if(info.pass_INFO==2){pass_state="합격"}
                     else if(info.pass_INFO==3){pass_state="합격의지없음"}
                     else if(info.pass_INFO==4){pass_state="예치금반환(환불)"}
                     var str = '<tr onmouseover="this.style.backgroundColor=\'#eee\';" onmouseout="this.style.backgroundColor=\'\';">'
                     + '<th scope="row">' + info.stud_NO
                     + '</th>' 
                     //+ '<td> <input type="checkbox" name="' + info.stud_NO + '"></td>'
                     + '<td>' + info.korn_FLNM + '</td>' 
                     +'<td>' + info.age + '</td>'
                     + '<td>' + info.user_BRDT + '</td>'
                     + '<td>' + info.gender_CD + '</td>'
                     + '<td>' + info.eml_ADDR + '</td>'
                     + '<td>' + info.telno + '</td>'
                     + '<td>' + info.rel_TELNO + '</td>'
                     + '<td>' + info.rel_CD + '</td>'
                     + '<td>' + info.zip + '</td>' 
                     + '<td>' + info.addr + '</td>' 
                     +'<td>'   + info.daddr + '</td>' 
                     + '<td>' +'<input type="button" onclick="open3(' + info.pdf + ')"value="pdf보기" /></td>' 
                     + '<td> <select class="creditSelect"><option value=0>문자대기</option><option value=1>예치금 대기</option><option value=2>합격</option><option value=3>합격의지없음</option><option value=4>예치금반환(환불)</option></select></td>'
                     +'</tr>';
                     $('.table_body').append(str);
                     $(".creditSelect").val(info.pass_INFO).attr("selected", "selected");
                  });
               }

            });
         });
   
   $('.table_body').on('click', 'tr', function() {
        // 클릭된 행의 각 셀 값을 가져옵니다.
        var stud_NO = $(this).find('th').text();
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
        var pdf = $(this).find('td:eq(11)').text();
        var PASS_INFO = $(this).find('td:eq(12)').text();

        // 입력란에 값을 채웁니다.
        
        $('#no').val(stud_NO);
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
        $('#pdf').val(pdf);
        $('#PASS_INFO').val(PASS_INFO);
        // 나머지 입력란에도 마찬가지로 값을 채워줍니다.
        // ...

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
</style>
<body>



   <div class="container">
      <h2>학생 정보</h2>
      <form>
         <div class="form-group row">
            <label for="name" class="col-sm-2 col-form-label">순번</label>
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
      </form>
   </div>



   <br>
   <br>
   <br>
   <br> 학생 이름:
   <input type="text" id="name">
   <button type="button" id="searchStudent">검색</button>
<div class="scroll">
   <table class="table">
      <thead>
         <tr>
            <th scope="col">순번</th>
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
            <th scope="col">PDF보기</th>
            <th scope="col">합격여부</th>
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
=======
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

$(function(){
	$('#searchStudent').click(function() {
				  $("input:checkbox[id='check_all']").prop("checked", false);
				$.ajax({
					url : '/passInfo',
					type : 'GET',
					data : {
						"KORN_FLNM" : $('#name').val(),"CRCLM_CD" : $('#department').val(), "RECRT_SCHDL_CD":$('#category').val(),"RECRT_YEAR":$('#year').val()},
					dataType : "json",
					success : function(data) {
						var iii = data.list_L;
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
					
						$.each(data.list, function(i, info) {
							var selectid="creditSelect"+info.pass_INFO;
							var str = '<tr onmouseover="this.style.backgroundColor=\'#eee\';" onmouseout="this.style.backgroundColor=\'\';">'
							+ '<td scope="row" class="checkbox_i"> <input type="checkbox" class="checkbox_a" name="checkbox_c"></td>' 
							if(i<=30){str += '<td class="passrank">' + (i+1)	+ '번</td>' ;}
							else{str += '<td class="passrank">예비' + i-29	+ '번</td>' ;}
						 	str += '<td class="appl_no">' + info.appl_NO	+ '</td>' 
							+ '<td class="name_m">' + info.korn_FLNM + '</td>' 
							+ '<td>' + info.age + '</td>'
							+ '<td>' + info.user_BRDT + '</td>'
							+ '<td>' + info.gender_CD + '</td>'
							+ '<td>' + info.eml_ADDR + '</td>'
							+ '<td class="telno_m">' + info.telno + '</td>'
							+ '<td>' + info.rel_TELNO + '</td>'
							+ '<td>' + info.avg + '</td>'
							+ '<td class="find_Select"> <select id='+selectid+' class="creditSelect"><option value=0>문자대기</option><option value=1>예치금 대기</option><option value=2>합격</option><option value=3>합격의지없음</option><option value=4>예치금반환(환불)</option></select></td>'
							$('.table_body').append(str);
							$('#'+selectid).val(info.pass_INFO).attr("selected", "selected");
							if(i<=(data.list_L)){
								return false;
							}
						});
					}

				});
			});
	
		//예비번호 문자보내기버튼
	$('.permit1').click(function() {
		if(confirm("예약번호문자를 보내시겠습니까?")){
	    var checkBoxArr = new Array(); 
		var num=0;
	  $("input:checkbox[name='checkbox_c']:checked").each(function(i) {
	 	 var name_m = $(this).closest('tr').find('.name_m').text();
	 	 var telno_m = $(this).closest('tr').find('.telno_m').text();
	 	 var passrank = $(this).closest('tr').find('.passrank').text();

		num=num+1;
	  	checkBoxArr[i] = {"no" : i, "name_m" : name_m, "telno_m":telno_m,"passrank":passrank}
	});
	  $.ajax({
			url : "/permit1",
			type : "post",
			cache : false,
	      	data: { "checkBoxArr" : checkBoxArr ,"num" : num }     
	   });
	}
	});
	
	//계좌번호 문자보내기 버튼
	$('.permit2').click(function() {
		if(confirm("계좌번호문자를 보내시겠습니까?")){		
	    var checkBoxArr = new Array(); 
		var num=0;
	  $("input:checkbox[name='checkbox_c']:checked").each(function(i) {
	 	 var name_m = $(this).closest('tr').find('.name_m').text();
	 	 var telno_m = $(this).closest('tr').find('.telno_m').text();
		num=num+1;
	  	checkBoxArr[i] = {"no" : i, "name_m" : name_m, "telno_m":telno_m}
	});
	  $.ajax({
			url : "/permit1",
			type : "post",
			cache : false,
	      	data: { "checkBoxArr" : checkBoxArr ,"num" : num }     
	   });
		}
	});
	//       저장버튼
	$('.save_button1').click(function() {
		if(confirm("저장을 하시겠습니까?")){
	    var checkBoxArr = new Array(); 
		var num=0;
	  $("input:checkbox[name='checkbox_c']:checked").each(function(i) {
	 		 var  find= $(this).closest('tr').find('.find_Select').children(".creditSelect").val();
	 		 var  state= $(this).closest('tr').find('.appl_no').text();
			num=num+1;
		  	checkBoxArr[i] = {"no" : i, "appl_NO" : state,"PASS_INFO" : find}
		});
	$.ajax({
			url : "/passUpdate1",
			type : "post",
			cache : false,
      		data: { "checkBoxArr" : checkBoxArr ,"num" : num }
		});
		}
		
		
	});
	//       입학확정버튼
	$('.admission').click(function() {
		if(confirm("체크된 인원들을 입학 확정시키겠습니까?")){
	    var checkBoxArr = new Array(); 
		var num=0;
	  $("input:checkbox[name='checkbox_c']:checked").each(function(i) {
	 		 var  state= $(this).closest('tr').find('.appl_no').text();
			num=num+1;
		  	checkBoxArr[i] = {"no" : i, "appl_NO" : state}
		});
	$.ajax({	
			url : "/admission",
			type : "post",
			cache : false,
      		data: { "checkBoxArr" : checkBoxArr ,"num" : num }
		});
		}
	});
	//체크박스 전체 체크및해제
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
				<label>입학년도 <select
					class="custom-select custom-select-sm form-control form-control-sm"
					id="year">
						<c:forEach items="${list_c}" var="y">
							<option>${y.RECRT_YEAR }</option>
						</c:forEach>
				</select>

				</label> <label>지원 전형<select
					class="custom-select custom-select-sm form-control form-control-sm"
					id="category">
							<option value="1">정시</option>
							<option value="2">수시</option>
				</select>

				</label> <label>지원 학과 <select
					class="custom-select custom-select-sm form-control form-control-sm"
					id="department">
						<c:forEach items="${list_d}" var="d">
							<option value="${d.CRCLM_CD}">${d.department }</option>
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
			</tr>
		</thead>
		<tbody class="table_body">
		</tbody>
		<input type="button" class="permit1" value="예비번호 문자보내기">  &nbsp;
		<input type="button" class="permit2" value="계좌번호 문자보내기">  &nbsp;
		<input type="button" class="save_button1" value="저장하기">  &nbsp;
		<input type="button" class="admission" value="입학확정">  &nbsp;
	</table>
</div>





	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
>>>>>>> refs/heads/wook
</html>