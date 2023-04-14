<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원자 평가</title>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
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
       ]
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
                <th>테스트1</th>
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
</body>
</html>