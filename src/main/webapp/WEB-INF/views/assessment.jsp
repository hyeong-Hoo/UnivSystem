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
    $('#mytable').DataTable({
        ajax: {
           url  :'/asm', 
           type : 'GET',
           dataSrc : ''
        },
       columns: [
           {data: "stud_NO"},
           {data: "category"},
           {data: "math"},
           {data: "english"}, 
           {data: "avg"},
           {
               data: "passed",
               render: function (data, type, row) {
            	   var options = '';
                   if (data == true) {
                       options += '<option value="true" selected>합격자</option>';
                       options += '<option value="false">불합격자</option>';
                   } else {
                       options += '<option value="true">합격자</option>';
                       options += '<option value="false" selected>불합격자</option>';
                   }
                   return '<select id="passed-' + row.stud_NO + '" name="classification" class="form-control">' + options + '</select>';
               }
           }
       ],
       initComplete: function () {
           /* Column별 검색기능 추가 */
           $('#mytable_filter').prepend('<select id="select" class="form-control"></select>');
           $('#mytable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
               $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
           });
           $('.datatables_filter input').unbind().bind('keyup', function () {
               var colIndex = document.querySelector('#select').selectedIndex;
               table.column(colIndex).search(this.value).draw();
           });
      }
    });
    
    $('#saveBtn').click(function() {
        var tableData = $('#mytable').DataTable().data().toArray();
        var updatedData = [];
        for (var i = 0; i < tableData.length; i++) {
            var row = tableData[i];
            var passed = $('#passed-' + row.stud_NO).val() == "true" ? true : false; // 각 행에 대한 id 값을 이용하여 선택자를 지정
            updatedData.push({
                STUD_NO: row.stud_NO,
                passed: passed
            });
        }
        
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
});


	

</script>

<body>
<table id="mytable" class="display" style="width:100%">
        <thead>
            <tr>
                <th>번호</th>
                <th>유형</th>                
                <th>테스트2</th>
                <th>테스트3</th>
                <th>테스트4</th>
                <th>구분</th>
                
                
               
            </tr>
        </thead>
        <tbody>           
        </tbody>
        
    </table>
    
<button id="saveBtn">저장</button>	



<!-- grid  -->
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>