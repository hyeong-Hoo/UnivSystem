<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.app_no {width: 10%; text-align: center;}
.crclm_code {width: 10%;}
.year{width: 10%; ext-align: center;}
.app_name {width: 10%; ext-align: center;}
.app_gender {width: 10%; text-align: center;}
.total {width: 10%; text-align: center;}
.grade {width: 10%; text-align: center;}
.interview {width: 10%; text-align: center;}
.department {width: 10%; text-align: center;}
table {color: black;}
th {text-align: center; background-color: #a2bfdd; border: solid 0.5px;}
td {text-align: center;}
input {width: 100%;}
.send_btn {background-color: #3E74C7; color: white; border-radius: 3px; height: 30px; width: 60px;}
.container-fluid {height: 100%;}
.test {border: none; text-align: center;}
.test:focus {outline: none;}
.no {border: none; text-align: center;}
.no:focus {outline: none;}
.score {text-align: center;}
</style>
<script type="text/javascript">
	$(function() {

		$(document).on(
				"change",
				".score",
				function() {

					var appl_no = $(this).parent().prev().prev().prev().prev()
							.prev().prev().prev().text(); // 지원자 번호 
					var gradeScore = $(this).parent().prev().text(); //학생부 점수 

					var interviewScore = $(this).val(); // 면접 점수 
					var totalScore = Number(gradeScore)
							+ Number(interviewScore); // 총 점수 

					$(this).parent().next().find(".test").val(totalScore);

				});
		$(document).ready(function() {
			$("#disableButton").click(function() {
				$("input[name='inter_score']").prop("readonly", true);
			});
		});
	});
</script>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>CAU - 면접평가</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!--  jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<br>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">면접평가</h1>
		</div>
		<!-- Divider -->
		<hr class="sidebar-divider">
		
		<form action="/pr_score" method="post">
			<table id="datalist" class="display" border="1" style="width: 100%">
				<thead>
					<tr>
						<th class="app_no">접수번호</th>
						<th class="crclm_code">학과코드</th>
						<th class="year">연도</th>
						<th class="app_name">이름</th>
						<th class="app_gender">성별</th>
						<th class="department">학과명</th>
						<th class="grade">환산점수(학생부)</th>
						<th class="interview">환산점수(면접)</th>
						<th class="total">총점수</th>
					</tr>
				</thead>

				<tbody id="auth_body">
					<c:forEach items="${appl_list }" var="appl">
						<tr>
							<td class="appl_no"><input class="no" type="number"
								name="appl_no" value="${appl.appl_NO }" readonly="readonly"></td>
							<td class="appl_code">${appl.CRCLM_CD }</td>
							<td class="appl_year">${appl.RECRT_YEAR }</td>
							<td class="appl_name">${appl.KORN_FLNM }</td>
							<td class="appl_gender">${appl.GENDER_CD }</td>
							<td class="appl_department">${appl.department }</td>
							<td class="appl_grade" name="grade_score">${appl.grade }</td>
							<td class="appl_interview"><input type="number"
								value="${appl.interview }" name="inter_score" class="score"
								min="0" max="50"
								oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"
								maxlength="2"></td>
							<td class="appl_total"><input type="number" class="test"
								name="totalscore" value="${appl.total }" readonly="readonly"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<button type="submit" class="send_btn" id="disableButton">저장</button>
		</form>
	</div>
	<!-- /.container-fluid -->
	<br>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
</body>
</html>