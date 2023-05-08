<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
ul, li{display: block; list-style: none; float: left;}
.box{width: 100%; height: 40px; text-align: center; color: black; border-radius: 3px; background-color: #a2bfdd; }
.t1{width: 40%; position: relative; top: 5px;}
.t2{width: 40%; position: relative; top: 7px;}
.t3{width: 20%; position: relative; top: 5px;}
table{width: 100%; color: black;}
thead{background-color: #c6cdd4;}
.pr_no{width:7%; text-align: center;}
.major{width:6%; text-align: center;}
.name{width:6%; text-align: center;}
.birth{width:10%; text-align: center;}
.email{width:14%; text-align: center;}
.telno{width:12%; text-align: center;}
.addr{width:16%; text-align: center;}
.detail_addr{width:14%; text-align: center;}
.gender{width:4%; text-align: center;}
.authority{width:6%; text-align: center;}
.result{width:5%; text-align: center;}
container-fluid{height: 100%;}
.auth_btn{background-color: #3E74C7; color: white; border-radius: 3px;  height: 30px; width: 80px;}


</style>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CAU - 교수정보권한  </title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">CAU </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">



            <!-- Nav Item - 공통관리  Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>공통관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">공통관리</h6>
                        <a class="collapse-item" href="com_department">부서정보관리</a>
                        <a class="collapse-item" href="com_userinfo">사용자정보관리</a>
                        <a class="collapse-item" href="com_right">권한관리</a>
                        <a class="collapse-item" href="com_notice">공통게시판관리</a>
                        <a class="collapse-item" href="com_pw">비밀번호변경</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - 학생관리  Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>학생관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">학생관리</h6>
                        <a class="collapse-item" href="stud_standard">기준정보관리</a>
                        <a class="collapse-item" href="stud_record">학적부여관리</a>
                        <a class="collapse-item" href="stud_admission">입학정원관리</a>
                        <a class="collapse-item" href="stud_personal">개인신상조회</a>
                    </div>
                </div>
            </li>
            <!-- Nav Item - 입시관리  Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>입시관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">입시관리</h6>
                        <a class="collapse-item" href="ent_standard">기준정보관리</a>
                        <a class="collapse-item" href="ent_highschool">고교정보관리 </a>
                        <a class="collapse-item" href="ent_grade">환산등급관리 </a>
                        <a class="collapse-item" href="ent_guideline">모집요강관리</a>
                        <a class="collapse-item" href="ent_selection">선발전형배점 </a>
                        <a class="collapse-item" href="ent_application">입학원서관리</a>
                        <a class="collapse-item" href="ent_student">입학학생관리</a>
                        <a class="collapse-item" href="ent_volunteer">지원자확인용</a>
                        <a class="collapse-item" href="ent_schoolgrade">내신성적관리</a>
                        <a class="collapse-item" href="ent_SATscore">수능성적관리</a>
                        <a class="collapse-item" href="ent_prize">입상성적관리</a>
                        <a class="collapse-item" href="ent_admission">입학사정관리</a>
                        <a class="collapse-item" href="ent_memberspassed">총원합격관리</a>
                        <a class="collapse-item" href="ent_acceptance">합격확정관리</a>
                        <a class="collapse-item" href="ent_freshman">신입생관리</a>
                        
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseRegister"
                    aria-expanded="true" aria-controls="collapseRegister">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>등록관리</span>
                </a>
                <div id="collapseRegister" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">등록관리</h6>
                        <a class="collapse-item" href="regi_standard">기준정보관리</a>
                        <a class="collapse-item" href="regi_cost">등록금액관리</a>
                        <a class="collapse-item" href="regi_costall">등록금관련 전부</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseClass"
                    aria-expanded="true" aria-controls="collapseClass">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>교직관리</span>
                </a>
                <div id="collapseClass" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">교직관리</h6>
                        <a class="collapse-item" href="professor">교수정보입력</a>
                        <a class="collapse-item" href="pr_info">교수정보권한</a>
                        <a class="collapse-item" href="pr_authority">면접평가</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자 이름</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                             
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- 페이지 제목  -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">교수정보</h1>
                    </div>
                    <!-- Divider -->
          			<hr class="sidebar-divider">
                    <!-- 페이지 헤더  -->
                    <div class="search">
                        <form action="/pr_info_search" method="post" id="alt">
						<!-- searchbox -->
						<ul class="box">
							<li class="t1">교수이름 &nbsp; <input type="text" name="name_search" id="name_search" value=${name_search }></li>
							<li class="t2">학과코드 &nbsp; <input type="text" name="code_search" id="code_search" value=${code_search }></li>
							<li class="t3"><button class="search_btn" type="button"><img alt="icon" src="img/search_icon.png" width="20" height="20"></button></li>
						</ul>
						</form>
                    </div>
                    <br>
                   
					<!-- 페이지 리스트  -->
					<form action="/pr_info_save" name="save" id="save" method="post">
					<table border="1">
						<thead>
							<tr>
								<th class="pr_no">교수번호</th>
								<th class="major">학과코드</th>
								<th class="name">한글성명</th>
								<th class="birth">생년월일</th>
								<th class="email">이메일</th>
								<th class="telno">연락처</th>
								<th class="addr">주소</th>
								<th class="detail_addr">상세주소</th>
								<th class="gender">성별</th>
								<th class="authority">평가권한</th>
								<th class="result">결과</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list }" var="pr">
							<tr>
								<td class="pr_no">${pr.INSTR_NO }</td>
								<td class="major">${pr.CRCLM_CD }</td>
								<td class="name">${pr.KORN_FLNM }</td>
								<td class="birth">${pr.USER_BRDT }</td>
								<td class="email">${pr.EML_ADDR }</td>
								<td class="telno">${pr.TELNO }</td>
								<td class="addr">${pr.ADDR }</td>
								<td class="detail_addr">${pr.DADDR }</td>
								<td class="gender">${pr.GENDER }</td>
								<td class="authority">
								<!-- 체크박스로  -->
<!-- 								<input type="checkbox" id="authY" name="authY"><label for="authY">&nbsp;권한</label> -->
								
								<!--  라디오로  -->
								<input type="radio" id="authR" value="권한"><label for="authR">&nbsp;권한</label>
								
								<!-- 옵션 선택으로 -->
<!-- 								<select name="auth" id="auth" onchange="save(this.value)"> -->
<!-- 									<option value="" selected disabled>선택</option> -->
<!-- 									<option id="0" value="0">없음</option> -->
<!-- 									<option id="1" value="1">권한</option> -->
<!-- 								</select> -->
								</td>
								<td class="result">${pr.ENDST_NO }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<br>
					<button type="button" class="auth_btn">권한주기</button>
					</form>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2023</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	 <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>
	
	
    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
	
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>


</body>
<script>
$(function(){
	$(".search_btn").click(function(){
		$("#code_search").val();
		$("#name_search").val();
		$("#alt").submit();
	});
	
	$(".auth_btn").click(function(){
		$("#auth").val(0);
		$("#auth").val(1);
		$("#send").submit();
	});
	
	
});
// function YNcheck(obj){
// 	var checked = obj.checked;
// 	if(checked){
// 		obj.value="권한";
// 	}else{
// 		obj.value="없음"
// 	}
// };









</script>
</html>