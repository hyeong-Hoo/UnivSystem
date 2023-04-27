<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(function(){
    $("#Admission").click(function(){
        location.href = 'Admission';
    });
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{font-family: 'IBM Plex Sans KR', sans-serif;}
    span{display: block}
    body{
        margin: 0;
        padding: 0;
        height:930px;
    }
    .a{
    width:1920px;
    height:1000px;
    background-image: url('./images/main.jpg');
    }
    .container{
        margin: 0 auto;
        width:1440px;
        height:inherit;
        background-color:azure;
       z-index: 1;
    }
    .main-first{
        width:480px;
        height:inherit;
        background-color:darkblue;
        float:left;
    }
    .logo_top{
        width:480px;
        height:150px;
    }
    .logo-top-text{
        font-size: 40px;
        color:aliceblue;
        text-align: center;
        line-height: 100px;
    }
    .logo-top-text2{
        font-size: 20px;
        color:aliceblue;
        text-align: center;
        line-height: 0px;
        letter-spacing:5px;
    }

    .logo_middle{
        width:480px;
        height:300px;
    }
    .logo-middle-cong{
        position: relative;
        top:250px;
        left:300px;
        width:130px;
        height: 30px;
        font-size: 18px;
        font-weight: 900;
        color:darkblue;
        text-align: center;
        line-height: 34px;
        background-color: aliceblue;
        border-radius: 20px;
        letter-spacing:2px;

    }
    .logo_bottom{
        width:480px;
        height:428px;
    }
    .logo_bottom-text{
        text-align: center;
        font-size:25px;
        font-weight: 300;
        color:aliceblue;
    }
    .logo_bottom-text2{
        text-align: center;
        font-size:45px;
        font-style: italic;
        font-weight: 900;
        color:aliceblue;

    }
    .logo_bottom-text3{
        text-align: center;
        font-size: 20px;
        margin-top: 20px;
        font-weight: 300;
        letter-spacing:5px;
        color:cornflowerblue;
    }
        .logo_bottom-text4{
          text-align: center;
        font-size: 20px;
        margin-top: 100px;
        font-weight: 200;
        letter-spacing:5px;
        color:aliceblue;
    }
    .Admission_btn{
        position: relative;
        left: 85px;
        top:20px;
        width:300px;
        height:50px;
        font-size: 20px;
        font-weight: 900;
        color:darkblue;
        letter-spacing:10px;
        background-color: #FFC314;
        border-style: none;
        border-radius: 50px;
    }
    .Admission_btn:hover{
    color:white;
    cursor : pointer;
    }
    .login{
        text-align:center;
        margin: 0 auto;
        margin-top:60px;
        border-radius:2px;
        width:400px;
        height:100px;
        font-weight:600;
        color:darkblue;
        background-color:#e3c102;
    }
    input[type=text]{
    border-style:none;
    border-radius:3px;
    width:200px;
    height:20px;
    text-align:center;
    }
    input[type=password]{
    border-style:none;
    border-radius:3px;
    width:200px;
    height:20px;
    text-align:center;
    }
    .login-btn{
    color:white;
    font-size:15px;
    border-style:none;
    border-radius:2px;
    width:100px;
    height:50px;
    background-color:darkblue;
    }
    .login-btn:hover{
    color:#e3c102;
    cursor : pointer
    }
    .main-second{
        width:480px;
        height:inherit;
        float:left;
        background-color:#edf4ff;
    }
    .service-top{
        width:480px;
        height:340px;
    }
    .head-text{
        position: relative;
        top:30px;
        left: 25px;
        width:300px;
        height:50px;
        font-size:35px;
        font-weight: 500;
        color:black;
        text-decoration: underline;
    }
    .notice_text{
        position:relative;
        left:100px;
        top:50px;
    }
    .service-top-table{
        position: relative;
        top:40px;
        width:480px;
        height:250px;
        text-align: center;
        border-spacing: 20px;
        border-collapse: separate;
    }
    .tr1>td{
        border: 1px solid #E0EBFF;
        border-radius: 20px;
    }

    .service-middle{
        width:480px;
        height:340px;

    }
    .middle-table{
        position: relative;
        top:40px;
        width:480px;
        height:250px;
        text-align: center;
        border-spacing: 20px;
        border-collapse: separate;
    }
    .service-bottom{
        width:480px;
        height:300px;

    }
    .service-bottom-text{
        position: relative;
        top:160px;
        left: 40px;
    }
    .main-third{
        width:480px;
        height:inherit;
        float:left;
        background-color:#edf4ff;
    }
    .v_line{
    position: absolute;
    border-left : 1px solid #BECDFF;
    height : inherit;

    }
      .service2-top{
        width:480px;
        height:340px;

    }
    .service2-middle{
        width:480px;
        height:340px;

    }
    .service2-bottom{
        width:480px;
        height:300px;
    }
    .service2-bottom-text{
        position: relative;
        top:160px;
        left: 140px;
    }
    .material-symbols-outlined {
    font-size:50px;
    color:darkblue;
      font-variation-settings:
      'FILL' 0,
      'wght' 200,
      'GRAD' 200,
      'opsz' 48
    }
    .logout-btn{
   	 	width:200px;
    	height:30px;
        font-size: 20px;
        font-weight: 900;
        color:#FFC314;
        letter-spacing:10px;
        background-color: darkblue;
        border-style: none;
        border-radius: 10px;
    }
    .logout-btn:hover{
    	color:white;
    	cursor: pointer;
    }
    .goManagement{
    	margin:0 auto;
    	margin-top:20px;
    	width:200px;
    	height:30px;
        font-size: 20px;
        font-weight: 900;
        color:darkblue;
        letter-spacing:5px;
    }
    .goManagement:hover{
    	color:white;
    	cursor : pointer;
    }
</style>
</head>
<body>
<div class="a">
<div class="container">
    <div class="main-first">
    <div class="logo_top">
        <span class="logo-top-text">중앙입학서비스</span>
        <span class="logo-top-text2">Choogang Service</span>
    </div>
    <div class="logo_middle">
        <span class="logo-middle-cong">환영합니다!</span>
    </div>
        <div class="logo_bottom">
            <span class="logo_bottom-text">정보와 지식을 끊임없이 탐구하는 중앙</span>
            <span class="logo_bottom-text2">Choogang University</span>
            <span class="logo_bottom-text3">Choogang Login</span>
            <button type="button" class="Admission_btn" id="Admission">입학지원</button>
            <% if (request.getUserPrincipal() == null) { %>
            <form action="/auth" method="post">
            <table class="login">
            <tr>
<!--             <td>학생<input type="radio" name="chu">교수<input type="radio" name="chu"></td> -->
            </tr>
            <tr>
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <td><input type="text" name="USER_ID" placeholder="아이디"></td>
            <td rowspan="2"><button type="submit" class="login-btn">로그인</button></td>
            </tr>
            <tr>
            <td><input type="password"  name="PSWD" placeholder="비밀번호"></td>
            </tr>
            <td><div id="findIdFw"></div><a href="/Login/findid" onclick="location.href='Login/findid.jsp'">아이디찾기 / 비밀번호찾기</a></div></td>
            </table>
            </form>
            <% } else { %>
            	<table class="login">
            <tr>
            <td><form action="/logout" method="post">
            <div class="goManagement"><a href="/index" onclick="location.href='index.jsp'"> 학사관리로 이동 </a></div><br>
        	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
       		 <button type="submit" class="logout-btn">로그아웃</button>
   			 </form>
   			</td>
            </tr>
            </table>
            <% } %>
            <span class="logo_bottom-text4">개인정보처리방침</span>
        </div>
    </div>
    <div class="main-second">
        <div class="service-top">
            <div class="head-text">Choogang Service</div>
            <table class="service-top-table">
            <tr class="tr1">
                <td><span class="material-symbols-outlined">
                    browse_activity
                    </span><br>학사정보</td>
                <td><span class="material-symbols-outlined">
                    view_compact_alt
                    </span><br>과목정보</td>
                <td><span class="material-symbols-outlined">
                    quick_reference_all
                    </span><br>접수확인</td>
            </tr>
            <tr class="tr1">
                <td><span class="material-symbols-outlined">
                    manage_search
                    </span><br>수강편람조회</td>
                <td><span class="material-symbols-outlined">
                    zoom_in
                    </span><br>성적평가조회</td>
                <td><span class="material-symbols-outlined">
                    transcribe
                    </span><br>온라인강의</td>
            </tr>
            </table>
        </div>
        <div class="service-middle">
            <div class="head-text">학사 LINK</div>
            <table class="middle-table">
                <tr>
                    <td>전자출결</td>
                    <td>온라인강의</td>
                </tr>
                <tr>
                    <td>학부모서비스</td>
                    <td>대학원입학지원</td>
                </tr>
                <tr>
                    <td>Inbiund 교환학생 신청</td>
                    <td>학생증발급</td>
                </tr>
            </table>
        </div>
        <div class="service-bottom">
            <div class="head-text">Choogang Notice</div>
            <div class="notice_text">학사 &emsp;| &emsp;입학지원 필독공지&emsp; | &emsp;2023.4.23 </div>

            <small class="service-bottom-text">COPYRIGHT(C)2023 CHOGANG UNUVERSUTY.ALL RIGHTS RESERVED</small>
        </div>
        </div>
    <div class="main-third">
        <div class="v_line"></div>
        <div class="service2-top">
        <div class="head-text">IT Service</div>
            <table class="service-top-table">
            <tr class="tr1">
                <td><span class="material-symbols-outlined">
                    transcribe
                    </span><br>인터넷 증명서</td>
                <td><span class="material-symbols-outlined">
                    mark_as_unread
                    </span><br>웹메일</td>
                <td><span class="material-symbols-outlined">
                    google_wifi
                    </span><br>신촌 IT서비스</td>
            </tr>
            <tr class="tr1">
                <td><span class="material-symbols-outlined">
                    mindfulness
                    </span><br>미래 IT서비스</td>
                <td><span class="material-symbols-outlined">
                    directions_bus
                    </span><br>셔틀버스</td>
                <td><span class="material-symbols-outlined">
                    conversion_path
                    </span><br>미래통학버스</td>
            </tr>
            </table>
        </div>
        <div class="service2-middle">
            <div class="head-text">행정 LINK</div>
            <table class="middle-table">
                <tr>
                    <td>ERP 행정정보시스템</td>
                    <td>연구관리 | YRI(통합연구업적)</td>
                </tr>
                <tr>
                    <td>공간대관시스템</td>
                    <td>협업시스템(그룹웨어)</td>
                </tr>
                <tr>
                    <td>신분증 발급</td>
                    <td>연말정산 시스템</td>
                </tr>
            </table>
        </div>
        <div class="service2-bottom">
            <div class="head-text">QnA</div>
            <div class="notice_text"> 연세대학교&emsp;| &emsp;입학지원&emsp; | &emsp;2023.4.23 </div>
            <small class="service2-bottom-text">06134 서울특별시 강남구 테헤란로7길7</small>
        </div>
        </div>
    </div>
</div>
</body>
</html>