<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link rel="stylesheet"	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>




<body>
	<br>
	<h2>정시 지원자 관리</h2>
	<br>
	<table id="asstable" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>지원학과</th>
				<th>언어</th>
				<th>수학</th>
				<th>영어</th>
				<th>평균</th>
				<th>지원자</th>
				<th>제출서류</th>
				<th>구분</th>



			</tr>
		</thead>
		<tbody>
		</tbody>

	</table>
	


	<button id="saveBtn1">저장</button>
	<button id="resetBtn1">초기화</button>


<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<!-- grid  -->
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
	<script>
	$(document).ready(function() {
						var table = $('#asstable').DataTable({
							"language": {
						        "emptyTable": "데이터가 없어요.",
						        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
						        "info": "_START_번 - _END_번 / 지원자 : _TOTAL_명 ",
						        "infoEmpty": "데이터 없음",
						        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
						        "search": "에서 검색: ",
						        "zeroRecords": "일치하는 데이터가 없어요.",
						        "loadingRecords": "로딩중...",
						        "processing":     "잠시만 기다려 주세요...",
						        "paginate": {
						            "next": "다음",
						            "previous": "이전"}
							},
			
							lengthChange: false,
							//표시 기능 숨기기
							info:true,
							paging: false,
						        //페이징 기능 끄기
						        scrollY: '400px',
						        //스크롤을 사용할 공간 지정
						        scrollCollapse: true,
						        //스크롤이 작동할 때, 테이블 크기를 조정할지 여부 설정
							//정보 표시 기능 숨기기
							
						            
        ajax: {
            url: '/asm',
            type: 'GET',
            dataSrc: ''
        },
        columns: [
            { data: "appl_NO" },
            { data: "korn_FLNM" },
            { data: "department" },
            { data: "korean" },
            { data: "math" },
            { data: "english" },
            { data: "avg" },
            { data: "passed" },
								{
									data : "pdf",
									render : function(data,
											type, row) {
										var decodedPdf = atob(row.pdf);
										return '<button id="pdf-'
												+ row.appl_NO
												+ '" class="btn btn-sm btn-outline-primary" onclick="openPdf(\''
												+ decodedPdf
												+ '\')">PDF</button>';
									}

								},
								{
									data : "passed",
									render : function(data,
											type, row) {
										var options = '<option value="지원자">지원자</option>'
												+ '<option value="합격">합격</option>'
												+ '<option value="불합격">불합격</option>';

										var selected = data
												|| 'applicant'; // passed 값이 null 이면 'applicant'로 설정

										return '<select id="passed-' + row.appl_NO + '" name="classification" class="form-control">'
												+ options
														.replace(
																'value="'
																		+ selected
																		+ '"',
																'value="'
																		+ selected
																		+ '" selected')
												+ '</select>';
									}

								} ],

						initComplete : function() {
							
							var filterHtml = '<div class="d-flex">'
									+ '<div class="mx-2">'
									+ '<select id="dept_select" class="form-control">'
									+ '<option value="">지원 학과</option>'
									+ '<option value="기계과">기계과</option>'
									+ '<option value="컴퓨터공학과">컴퓨터공학과</option>'
									+ '<option value="전기전자과">전기전자과</option>'
									+ '<option value="화학공학과">화학공학과</option>'
									+ '</select>'
									+ '</div>'
									+ '<div class="mx-2">'
									+ '<select id="status_select" class="form-control">'
									+ '<option value="">구분</option>'
									+ '<option value="지원자">지원자</option>'
									+ '<option value="합격">합격</option>'
									+ '<option value="불합격">불합격</option>'
									+ '</select>'
									+ '</div>'
									+ '<div class="mx-2">'
									+ '<input id="name_input" type="text" placeholder="이름 검색" class="form-control">'
									+ '</div>'
									+ '<button id="search_button" type="button" class="btn btn-primary">검색</button>'
									+ '</div>';

									$('#asstable_filter').html(filterHtml);

									$('#search_button').on('click', function() {
									    var name = $('#name_input').val();
									    table.column(1).search(name);

									    table.draw();
									});

									$('#dept_select').on('change', function() {
									    var dept = $('#dept_select').val();
									    table.column(2).search(dept);

									    table.draw();
									});	
									
									$('#status_select').on('change', function() {
									    var status = $('#status_select').val();
									    table.column(7).search(status); 

									    table.draw();
									});								
										
							}
						});
						
		

						

						$('#saveBtn1').click(function() {
						    var tableData = $('#asstable').DataTable().data().toArray();
						    var updatedData = [];
						    for (var i = 0; i < tableData.length; i++) {
						        var row = tableData[i];
						        var passed = $('#passed-' + row.appl_NO).val()
						        updatedData.push({
						            appl_NO : row.appl_NO,
						            passed : passed
												});
											}
						    // 서버에 변경된 데이터를 저장하고, 페이지를 다시 로드하여 변경된 데이터를 불러옴
						    $.ajax({
						        type : 'POST',
						        url : '/save',
						        data : JSON.stringify(updatedData),
						        contentType : 'application/json; charset=utf-8',
						        success : function(result) {
						            alert('저장되었습니다.');
						        },
						        error : function() {
						            alert('저장 중 오류가 발생하였습니다.');
						        }
													});
										});

						


						$('#resetBtn1').click(function() {
							$('#dept_input').val('');
							$('#name_input').val('');
							table.columns().search('').draw();
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
</body>


</html>