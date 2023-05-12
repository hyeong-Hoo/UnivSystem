<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content="">

<title>CAU - 교수정보입력</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<style>
ul {
	list-style: none;
	color: black;
}

li {
	float: left;
	color: black;
	padding-left: 0;
}

.top_box {
	width: 100%;
	height: 90px;
	border: 1px solid;
	border-radius: 3px;
	background-color: #a2bfdd;
}

.middle_box {
	width: 100%;
	height: 90px;
	border: 1px solid;
	border-radius: 3px;
	background-color: #a2bfdd;
}

.bottom_box {
	width: 100%;
	height: 170px;
	border: 1px solid;
	border-radius: 3px;
	background-color: #a2bfdd;
}

.Title1 {
	width: 15%;
	height: 35px;
	text-align: left;
	line-height: 35px;
}

.Answer1 {
	width: 80%;
	height: 35px;
}

.divide {
	width: 100%;
	height: 5px;
}

.text1 {
	width: 95%;
	margin: auto;
}

/* input { */
/* 	height: 35px; */
/* 	width: 100%; */
/* } */

.save_btn {
	background-color: #3E74C7;
	color: white;
	border-radius: 3px;
	height: 30px;
	width: 60px;
}

.container-fluid {
	height: 90%;
}
</style>

</head>
<body>
	
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">교수정보입력</h1>
		</div>
		<!-- Divider -->
		<hr class="sidebar-divider">

		<div class="info_table">
			<form action="/professor_info" name="form" id="form" method="post">
				<div class="top_box">
					<ul>
						<li class="divide"></li>
						<li class="Title1">아이디</li>
						<li class="Answer1"><input type="text" class="text1"
							id="pr_id" name="pr_id"></li>
						<li class="divide"></li>
						<li class="Title1">비밀번호</li>
						<li class="Answer1"><input type="password" class="text1"
							id="pr_pw" name="pr_pw"></li>
						<li class="divide"></li>
					</ul>
				</div>
				<br>
				<div class="middle_box">
					<ul>
						<li class="divide"></li>
						<li class="Title1">교수번호</li>
						<li class="Answer1"><input type="text" class="text1"
							id="pr_no" name="pr_no"
							oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"></li>
						<li class="divide"></li>
						<li class="Title1">학과코드</li>
						<li class="Answer1"><input type="text" class="text1"
							id="pr_dep" name="pr_dep"
							oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"></li>
						<li class="divide"></li>
					</ul>
				</div>
				<br>
				<div class="bottom_box">
					<ul>
						<li class="divide"></li>
						<li class="Title1">이름</li>
						<li class="Answer1"><input type="text" class="text1"
							id="pr_name" name="pr_name"></li>
						<li class="divide"></li>
						<li class="Title1">생년월일</li>
						<li class="Answer1"><input type="text" class="text1"
							id="pr_birth" name="pr_birth" maxlength="6"
							placeholder=" 예) 030201로 입력하세요"
							oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"></li>
						<li class="divide"></li>
						<li class="Title1">이메일</li>
						<li class="Answer1"><input type="text" class="text1"
							id="pr_email" name="pr_email" placeholder=" 예) hong12@gamil.com "></li>
						<li class="divide"></li>
						<li class="Title1">연락처</li>
						<li class="Answer1"><input type="text" class="text1"
							id="pr_telno" name="pr_telno" maxlength="11"
							placeholder=" - 없이 입력하세요"
							oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"></li>
						<li class="divide"></li>
						<li class="cole"><input type="hidden" value="PROFESSOR"></li>
					</ul>
				</div>
				<br>
				<div class="save">
					<button type="submit" class="save_btn">저장</button>
				</div>
			</form>
			<!-- info table 끝 -->
		</div>

	</div>
	<!-- End of Main Content -->
	<br>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
</body>

</html>