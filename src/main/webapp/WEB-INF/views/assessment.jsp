<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>지원자 평가</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

</head>
<script>
$(function() {
	$('#searchStudent').click(function() {
				$.ajax({
					url : '/asm',
					type : 'GET',
					data : {
						"KORN_FLNM" : $('#name').val()
					},
					dataType : "json",
					success : function(data) {
						
						  $('.table_body').empty(); // 기존 테이블 데이터를 지웁니다.
						  $('#asmno').val('');
						  $('#asmname').val('');
						  $('#asmdep').val('');
						  $('#asmkor').val('');
						  $('#asmmath').val('');
						  $('#asmeng').val('');
						  $('#asmavg').val('');
						  $('#asmpdf').val('');
						  $('#asmpas').val('');
						
						  
						$.each(data, function(i, info) {
							
						    var decodedPdf = atob(info.pdf); // pdf 데이터를 디코딩합니다.
						    

						    var options = '<option value="지원자">지원자</option>' +
						      '<option value="합격">합격</option>' +
						      '<option value="불합격">불합격</option>';
						    var selected = info.passed;
						 

						    var str = '<tr onmouseover="this.style.backgroundColor=\'#eee\';" onmouseout="this.style.backgroundColor=\'\';">'
						    	+ '<th scope="row" class="asmno">' + info.appl_NO + '</th>' 
						    	+ '<td class="asmname">' + info.korn_FLNM + '</td>' 
						    	+ '<td class="asmdep">' + info.department + '</td>'
						    	+ '<td class="asmkor">' + info.korean + '</td>'
						    	+ '<td class="asmmath">' + info.math + '</td>'
						    	+ '<td class="asmeng">' + info.english + '</td>'
						    	+ '<td class="asmavg">' + info.avg + '</td>'
						    	+ '<td class="asmpdf"><button id="pdf-' + info.appl_NO + '" class="btn btn-sm btn-outline-primary" onclick="openPdf(\'' + decodedPdf + '\')">PDF</button></td>'
						    	+ '<td class="asmpas">'+
						        '<select id="passed-' + info.appl_NO + '" name="classification" class="form-control">' +
						        options.replace('value="' + selected + '"', 'value="' + selected + '" selected') +
						      '</select>' +
						    '</td>' +
						  '</tr>';
																
									
							$('.table_body').append(str);
													
						
						});
						
					}

				});
				
				$('#saveBtn1').unbind('click').on('click', function() {
					// 저장 버튼 비활성화
					  $(this).prop('disabled', true);
					
					  var tableRows = $('.table_body tr');
					  var updatedData = [];
					  
					  tableRows.each(function(index, element) {
					    var applNo = $(element).find('.asmno').text();
					    var passed = $(element).find('.asmpas select').val();
					    
					    if (passed) { // passed 값이 있는 경우에만 업데이트할 객체에 추가
					      updatedData.push({
					        appl_NO : applNo,
					        passed : passed
					      });
					    }
					  });

					  // 서버에 변경된 데이터를 저장하고, 페이지를 다시 로드하여 변경된 데이터를 불러옴
					  $.ajax({
					    type : 'POST',
					    url : '/save',
					    data : JSON.stringify(updatedData),
					    contentType : 'application/json; charset=utf-8',
					    success : function(result) {
					      alert('저장되었습니다.');
					      
// 					      location.reload();
					  
// 					        document.getElementById("5-2").click();
							// 저장 버튼 활성화
    					  $('#saveBtn1').prop('disabled', false);
					      $('#saveBtn1').prop('disabled', false);

					    },
					    error : function() {
					      alert('저장 중 오류가 발생하였습니다.');
					      $('#saveBtn1').prop('disabled', false);

					    }
					  });
					});
				$('#resetBtn1').on('click', function() {
					  $('#name').val(''); // 검색 필드 초기화
					  $('.table_body').empty(); // 검색 결과 테이블 초기화

					});

				
				
			});
});

function openPdf(pdfData) {
	var iframe = '<iframe src="data:application/pdf;base64,' + pdfData
			+ '" width="100%" height="100%"></iframe>';
	var x = window.open();
	x.document.open();
	x.document.write(iframe);
	x.document.close();
}


</script>

<style>
.top{
border-bottom: solid 1px black;
}
</style>

<body>
	<br>
	<h3 class="top">정시 지원자 관리</h3>	
	<br>
	
	학생 이름
	<input type="text" id="name">
	<button type="button" id="searchStudent">검색</button>
	
	<table id="asstable" style="width: 100%">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>지원학과</th>
				<th>언어</th>
				<th>수학</th>
				<th>영어</th>
				<th>평균</th>
				<th>제출서류</th>
				<th>구분</th>



			</tr>
		</thead>
		<tbody class="table_body">
		</tbody>

	</table>
	


    <button id="saveBtn1" >저장</button>
	<button id="resetBtn1">초기화</button>



<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- grid  -->
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
	

</body>


</html>