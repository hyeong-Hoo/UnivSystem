<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<<<<<<< HEAD
=======




>>>>>>> refs/heads/final
<title>지원자 평가</title>
<<<<<<< HEAD
=======
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
>>>>>>> refs/heads/final

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<<<<<<< HEAD
	
=======
<!-- jQuery -->
<link rel="stylesheet"	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />

>>>>>>> refs/heads/final
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

<<<<<<< HEAD

</script>
=======
>>>>>>> refs/heads/final
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
				<th>제출서류</th>
				<th>구분</th>



			</tr>
		</thead>
		<tbody class="table_body">
		</tbody>

	</table>
	


    <button id="saveBtn1" >저장</button>
	<button id="resetBtn1">초기화</button>



<<<<<<< HEAD
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
=======

<!-- grid  -->
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>

>>>>>>> refs/heads/final
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<<<<<<< HEAD
	
=======
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
// 							paging: false,
// 						        //페이징 기능 끄기
// 						        scrollY: '400px',
// 						        //스크롤을 사용할 공간 지정
// 						        scrollCollapse: true,
						        //스크롤이 작동할 때, 테이블 크기를 조정할지 여부 설정
							//정보 표시 기능 숨기기
							
						            
        ajax: {
          url: '/asm',
          type: 'GET',
          dataSrc: ''
        },
        columnDefs: [
          { targets: 7, visible: false } // 7번째 컬럼 passed를 숨김
        ],
        order: [
          [0, 'asc']
        ],
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
            data: "pdf",
            render: function(data, type, row) {
              var decodedPdf = atob(row.pdf);
              return '<button id="pdf-' + row.appl_NO + '" class="btn btn-sm btn-outline-primary" onclick="openPdf(\'' + decodedPdf + '\')">PDF</button>';
            }
          },
          {
            data: "passed",
            render: function(data, type, row) {
              var options = '<option value="지원자">지원자</option>' +
                '<option value="합격">합격</option>' +
                '<option value="불합격">불합격</option>';
>>>>>>> refs/heads/final

<<<<<<< HEAD
=======
              var selected = data

              return '<select id="passed-' + row.appl_NO + '" name="classification" class="form-control">' +
                options.replace('value="' + selected + '"', 'value="' + selected + '" selected') +
                '</select>';
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
									    if (status === "합격") {
 									        table.column(7).search("^" + status + "$", true, false); // 정규표현식으로 검색
 									    } else {
 									        table.column(7).search(status);
 									    }
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
						        
						        if (passed) { // passed 값이 있는 경우에만 업데이트할 객체에 추가
						            updatedData.push({
						                appl_NO : row.appl_NO,
						                passed : passed
						            });
						        }
						    }
						    // 서버에 변경된 데이터를 저장하고, 페이지를 다시 로드하여 변경된 데이터를 불러옴
						    $.ajax({
						        type : 'POST',
						        url : '/save',
						        data : JSON.stringify(updatedData),
						        contentType : 'application/json; charset=utf-8',
						        success : function(result) {
						            alert('저장되었습니다.');	
						            
						            $('#asstable').DataTable().ajax.reload();
						            
						         	

					            					           				
						            },
						        error : function() {
						            alert('저장 중 오류가 발생하였습니다.');
						            
						        }
													});
										});
						
						$('#resetBtn1').click(function() {
							$('#dept_select').val('');
				            $('#status_select').val('');
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

>>>>>>> refs/heads/final
</body>


</html>