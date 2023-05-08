<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CAU - 교수정보입력   </title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

<style>
th{ width:20%; text-align: center; background-color: #c6cdd4; border: solid 0.5px; }
td{ width:30%;}
table{width:100%; color: black;}
.addr_btn{ border-radius: 3px; background-color: #3E74C7; color: white; width:30%;}
.addr_button{width: 7%; height: 40px; text-align: center; line-height: 35px; border: solid 0.5px;}
input{ height: 40px; width:100%;}
.save_btn{background-color: #3E74C7; color: white; border-radius: 3px;  height: 30px; width: 60px;}
.container-fluid{height: 80%;}
</style>

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
            <div id="content" >

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

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">교수정보입력</h1>
                    </div>
                    <!-- Divider -->
          			<hr class="sidebar-divider">
                    <div class="info_table">
                    <form action="/professor_info" name="form" id="form" method="post">
 	                   <table>
 		                   <tbody>
   	    	            		<tr>
        		            		<th>교수번호</th>
            		        		<td><input type="text" id="pr_no" name="pr_no"></td>
                    				<th>이름</th>
                    				<td><input type="text" id="pr_name" name="pr_name"></td>
                    			</tr>
                    			<tr>
        		            		<th>ID</th>
            		        		<td><input type="text" id="pr_id" name="pr_id"></td>
                    				<th>비밀번호</th>
                    				<td><input type="text" id="pr_pw" name="pr_pw"></td>
                    			</tr>
	                    		<tr>
    	                			<th>학과코드</th>
        	            			<td><input type="text" id="pr_dep" name="pr_dep"></td>
            	        			<th>생년월일</th>
                	    			<td><input type="text" id="pr_birth" name="pr_birth" placeholder=" 예) 030201로 입력하세요"></td>
                    			</tr>
                    			<tr>
                    				<th>이메일</th>
                    				<td><input type="text" id="pr_email" name="pr_email"></td>
	                    			<th>연락처</th>
    	                			<td><input type="text" id="pr_telno" name="pr_telno" placeholder=" - 없이 입력하세요"></td>
        	            		</tr>
            	        		<tr>
                	    			<th>우편번호</th>
                    				<td>
                    					<input type="hidden" id="confmKey" name="confmKey" value=""  >
										<input type="text" id="zipNo" name="zipNo" readonly style="width:68%">
										<input type="button" value="주소검색" class="addr_btn" onclick="goPopup();">
                    				</td>
         	           				<th>주소</th>
            	        			<td><input type="text" id="roadAddrPart1" name="roadAddrPart1" style="width:100%" readonly></td>
                	    		</tr>
                    			<tr>
                    				<th>상세주소</th>
                    				<td>
                    					<input type="text" id="addrDetail" name="addrDetail" style="width:100%" value="" placeholder="상세주소 입력하세요">
                    				</td>
                    				<th>성별</th>
                    				<td>
                    					<input type="text" id="pr_gender" name="pr_gender" placeholder="예) 남 또는 여로 입력하세요" >
                    				</td>
                    			</tr>                   		
                    		</tbody>
                   		</table>
                    <br>
                    <div class="save">
                   		<button type="submit" class="save_btn">저장</button>
                   	</div>
                    </form>
					<!-- info table 끝 -->
                    </div>

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

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function goPopup() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipNo').value = data.zonecode;
                document.getElementById("roadAddrPart1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addrDetail").focus();
            }
        }).open();
    }
    
</script>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>
	
	  <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>
