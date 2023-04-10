<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인신상조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
		$(function() {
		    $('#searchStudent').click(function() {
		      $.ajax({
		        url: '/info',
		        type: 'GET',
		        data:  { "KORN_FLNM" : $('#name').val() },
		        dataType: "json",
		        success: function(data) {
		        	 $('.table_body').empty(); // 기존 테이블 데이터를 지웁니다.

		                $.each(data, function(i, info) {
		                    var str = '<tr>' + 
		                        '<td>' + info.stud_NO + '</td>' +
		                        '<td>' + info.korn_FLNM + '</td>' +
		                        '<td>' + info.age + '</td>' +
		                        '<td>' + info.user_BRDT + '</td>' +
		                        '<td>' + info.gender_CD + '</td>' +
		                        '<td>' + info.eml_ADDR + '</td>' +
		                        '<td>' + info.telno + '</td>' +
		                        '<td>' + info.rel_TELNO + '</td>' +
		                        '<td>' + info.rel_CD + '</td>' +  
		                        '<td>' + info.zip + '</td>' +                            
		                        '<td>' + info.addr + '</td>' +
		                        '<td>' + info.daddr + '</td>' +
		                        '</tr>';

		                    $('.table_body').append(str);
		                });
		            }
		           
		        });
		    });
		});
    </script>
</head>
<body>
 학생 이름: <input type="text" id="name">
        <button type="button" id="searchStudent">검색</button>


 <table>
        <thead>
            <tr>
                <td>순번</td>
                <td>이름</td>
                <td>나이</td>
                <td>생년월일</td>
                <td>성별</td>
                <td>이메일</td>
                <td>전화번호</td>
                <td>비상전번</td>
                <td>비상누구</td>
                <td>우편번호</td>
                <td>주소</td>
                <td>상세주소</td>
            </tr>
        </thead>
        <tbody class="table_body">
        </tbody>
        </table>
        


학번(이름) <input ><button></button> 과정구분 <input> <br>
한글(한문) <input> 소속학과 <input> 입학일자 <input> <br>
이름(영문) <input> 학년 <input> <br>
주민번호 <input> 학적상태 <input> 분반 <input> <br>
휴대전화 <input> 최종변동상태 <input>  <br>
전화번호 <input> 졸업일자 <input> <br>
지도교수 <input>  <br>




					
</body>
</html>