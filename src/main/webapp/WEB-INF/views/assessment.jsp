<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원자 평가</title>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	
</head>

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
  
<script>
$(document).ready(function () {
    var table = $('#mytable').DataTable({
        ajax: {
            url: '/asm',
            type: 'GET',
            dataSrc: ''
        },
        columns: [
      	  { data: "stud_NO" },
      	  { data: "category" },
      	  { data: "department" },
      	  { data: "korean" },
      	  { data: "math" },
      	  { data: "english" },
      	  { data: "avg" },
      	  {
      	    data: "passed",
      	  render: function (data, type, row) {
      	      var options = '<option value="지원자">지원자</option>' +
      	                    '<option value="합격">합격</option>' +
      	                    '<option value="불합격">불합격</option>' +
      	                    '<option value="예비합격">예비합격</option>';

      	      var selected = data || 'applicant'; // passed 값이 null 이면 'applicant'로 설정

      	      return '<select id="passed-' + row.stud_NO + '" name="classification" class="form-control">' +
      	             options.replace('value="' + selected + '"', 'value="' + selected + '" selected') +
      	             '</select>';
      	    }
      	  }
      	],


	        initComplete: function () {
	            // Create two dropdown menus for the two columns
	            var dropdowns = '<div><select id="dept_select" class="form-control">' +
	                '<option value="">Select department</option>' +
	                '<option value="프론트">프론트</option>' +
	                '<option value="Back-end">Back-end</option>' +
	                '<option value="Design">Design</option>' +
	                '</select></div>' +
	                '<div><select id="type_select" class="form-control">' +
	                '<option value="">Select type</option>' +
	                '<option value="정시">정시</option>' +
	                '<option value="수시">수시</option>' +
	                '</select></div>';
	
	            // Add the dropdown menus to the DataTables' search filter
	            $('#mytable_filter').html(dropdowns);
	
	            // Handle the dropdown menus' change event
	            $('#dept_select, #type_select').on('change', function () {
	            	
	                var dept = $('#dept_select').val();
	                var type = $('#type_select').val();
	
	                table.column(1).search(type);
	                table.column(2).search(dept);
	                
	
	                // Redraw the table with the new search filter
	                table.draw();
	            });
	        }

       });






    
    $('#saveBtn').click(function() {
        var tableData = $('#mytable').DataTable().data().toArray();
        var updatedData = [];
        for (var i = 0; i < tableData.length; i++) {
            var row = tableData[i];
            var passed = $('#passed-' + row.stud_NO).val(); // 각 행에 대한 id 값을 이용하여 선택자를 지정
            updatedData.push({
                stud_NO: row.stud_NO,
                passed: passed
            });
        }
        console.log(updatedData); // 예시 출력
        
        $.ajax({
            type: 'POST',
            url: '/save',
            data: JSON.stringify(updatedData),
            contentType: 'application/json; charset=utf-8',
            success: function(result) {
                alert('저장되었습니다.');
            },
            error: function() {
                alert('저장 중 오류가 발생하였습니다.');
            }
        });
    });
    
    $('#resetBtn').click(function() {
        $('#dept_select').val('');
        $('#type_select').val('');
        table.columns().search('').draw();
    });
    
});


	

</script>

<body>

<table id="mytable" class="display" style="width:100%">
        <thead>
            <tr>
                <th>번호</th>
                <th>유형</th>     
                <th>지원학과</th>   
                <th>언어</th>        
                <th>수학</th>
                <th>영어</th>
                <th>평균</th>
                <th>구분</th>
                
                
               
            </tr>
        </thead>
        <tbody>           
        </tbody>
        
    </table>
    
<button id="saveBtn">저장</button>	
<button id="resetBtn">초기화</button>


<!-- grid  -->
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>