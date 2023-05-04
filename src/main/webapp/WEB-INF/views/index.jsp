<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <title>SB Admin 2 - Dashboard</title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">

span{
display: block;
}
.box{
width: calc(100% - 225px;);
height: auto;
}
.menubar{
width: auto;
height: 30px;
padding-left:20px;
text-align:center;
line-height: 30px;
background-color: #4D72DF;
font-size: 12px;
}
.barmenu {
	display: block;
   float: left;
   color: white;
}
.closebtn {
   float: left;
   background-color: #4D72DF;
   border: none;
   color: white;
   height: 30px;
   text-align: center;
   line-height: 30px;
   border-top-right-radius: 5px;
}

.contentbox{
width: 100%;
height: auto;
position: relative;
}
.testcontent{
width: inherit;
height: inherit;
position: absolute;
background-color: white;
}
.on1{
border-top-left-radius: 5px;
background-color: white;
color: black;
}
.on2{
background-color: white;
color: black;
}


</style>    
<script type="text/javascript">
$(function() {

    $(".collapse-item").click(function() {
                   var divid = $(this).attr('id');
                   var btnid = "btn" + divid;
                   var menuid = "menu" + divid;
                   var contentid = "content" + divid;
                   var btn = "<div class='tap'><span class='barmenu'"+"id="+menuid+"></span><input class='closebtn' type='button' value='x'"+"id="+btnid+"></div>";
                   var content = "<div class='testcontent'"+"id="+contentid+"></div>"
                         $.ajax({
                            url : "/tester",
                            type : "post",
                            cache : false,
                            dataType : "html",
                            data : {id : divid},
                            success : function(good) {
                            	$(document).ready(function(){
                                    $("#" + contentid).load(good);                            		
                                 	});
                            }
                         });
                   if ($("#"+contentid).length) {
                      $("#contentbox").empty();
                      $("#contentbox").append(content);
                   } else {
                      $("#contentbox").append(content);
                   }
                      if ($("#" + menuid).length) {
                    	  $("#"+menuid).attr('class','barmenu on1');
                          $("#"+menuid).next().attr('class','closebtn on2');
                          $("#"+menuid).parent().prevAll().children('span').attr('class','barmenu');
                          $("#"+menuid).parent().prevAll().children('input').attr('class','closebtn');
                          $("#"+menuid).parent().nextAll().children('span').attr('class','barmenu');
                          $("#"+menuid).parent().nextAll().children('input').attr('class','closebtn');
                      } else {
                         $("#menubar").append(btn);
                         $("#" + menuid).text($(this).text());
                        	 $("#"+menuid).attr('class','barmenu on1');
                             $("#"+menuid).next().attr('class','closebtn on2');
                             $("#"+menuid).parent().prevAll().children('span').attr('class','barmenu');
                             $("#"+menuid).parent().prevAll().children('input').attr('class','closebtn');
                     }
                      $("#"+menuid).click(function() {
                    	  $("#"+menuid).attr('class','barmenu on1');
                          $("#"+menuid).next().attr('class','closebtn on2');
                          $(this).parent().prevAll().children('span').attr('class','barmenu');
                          $(this).parent().prevAll().children('input').attr('class','closebtn');
                          $(this).parent().nextAll().children('span').attr('class','barmenu');
                          $(this).parent().nextAll().children('input').attr('class','closebtn');
                         $.ajax({
                            url : "/tester",
                            type : "post",
                            cache : false,
                            dataType : "html",
                            data : {id : divid},
                            success : function(good) {
                            	$(document).ready(function(){
                               $("#" + contentid).load(good);                            		
                            	});
                            }
                         });
                         if ($("#"+contentid).length) {
                        	 $("#contentbox").empty();
                             $("#contentbox").append(content);
                         } else {
                            $("#contentbox").append(content);
                         }
                         
                      });
                      $(document).on("click", "#"+btnid,
                            function() {
                               $(this).parent().remove();
                               $("#" + contentid).remove();
                            });
                      $(document).on("click", ".on2", function(){
                    	  if($(this).parent().prev().val() == "undefined"){
              	  			$(this).parent().next().children('span').trigger('click');
              	  		}else if($(this).parent().prev().val() == ""){
              	  			$(this).parent().prev().children('span').trigger('click');
              	  		}else{
              	  			
              	  		} 
                      });
                });

 });
</script>

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

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>목록</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>공통관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">공통관리</h6>
                        <a class="collapse-item" href="buttons">코드관리</a>
                        <a class="collapse-item" href="cards">사용자정보 관리</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>학생관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">학생관리</h6>
                        <span class="collapse-item" id="1">기준정보관리</span>
                        <span class="collapse-item" id="2">학적부여관리</span>
                        <span class="collapse-item" id="3">입학정원관리</span>
                        <span class="collapse-item" id="4">개인신상조회</span>
                    </div>
                </div>
            </li>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>입시관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">입시관리</h6>
                        <a class="collapse-item" href="blank">기준정보관리</a>
                        <a class="collapse-item" href="login">고교정보관리 </a>
                        <a class="collapse-item" href="register">환산등급관리 </a>
                        <a class="collapse-item" id="10">모집요강</a>
                        <a class="collapse-item" id="11">모집일 관리</a>
                        <a class="collapse-item" id="12">입학학생관리</a>
                        <a class="collapse-item" href="blank">지원자확인용</a>
                        <a class="collapse-item" href="blank">내신성적관리</a>
                        <a class="collapse-item" href="blank">수능성적관리</a>
                        <a class="collapse-item" href="blank">입상성적관리</a>
                        <a class="collapse-item" href="blank">입학사정관리</a>
                        <a class="collapse-item" href="blank">총원합격관리</a>
                        <a class="collapse-item" href="blank">합격확정관리</a>
                        <a class="collapse-item" href="blank">신입생관리</a>
                        
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>등록관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables">
                    <i class="fas fa-fw fa-table"></i>
                    <span>교직관리</span></a>
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

                    <div class="box">
                    	<div class="menubar" id="menubar"></div>
                    	<div class="contentbox" id="contentbox"></div>
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

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"></script>
</body>
</html>