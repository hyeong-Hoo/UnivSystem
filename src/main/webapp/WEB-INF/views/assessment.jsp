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
                   var 
                   options = '<option value="true" ' + (data ? 'selected' : '') + '>합격자</option>';
                   options += '<option value="false" ' + (!data ? 'selected' : '') + '>불합격자</option>';
                   return '<select name="classification" class="form-control">' + options + '</select>';
               }
           }
          
           
          
       ], createdRow: function (row, data, dataIndex) {
           $(row).attr('rowId', dataIndex);
       }
    
      });
    $('#saveBtn').click(function() {
        var data = $('#mytable').DataTable().data();
        var rows = [];
        data.each(function(item) {
            var row = {};
            row.stud_NO = item.stud_NO;
            row.math = item.math;
            row.english = item.english;
            row.avg = item.avg;
            row.passed = $('select[name="classification"]').eq(item.id).val() === "true" ? true : false;
            rows.push(row);
        });
        console.log(rows);
        $.ajax({
            url: '/save',
            method: 'post',
            data: JSON.stringify(rows),
            contentType: "application/json",
            success: function() {
                alert("Data saved successfully.");
            },
            error: function() {
                alert("Error while saving data.");
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