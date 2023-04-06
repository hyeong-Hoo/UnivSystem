<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=11" />

	<title>Login Page</title>
	
	<style>
		/* http://meyerweb.com/eric/tools/css/reset/ 
		v2.0 | 20110126
		License: none (public domain)
		*/
		html, body, div, span, applet, object, iframe,
		h1, h2, h3, h4, h5, h6, p, blockquote, pre,
		a, abbr, acronym, address, big, cite, code,
		del, dfn, em, img, ins, kbd, q, s, samp,
		small, strike, strong, sub, sup, tt, var,
		b, u, i, center,
		dl, dt, dd, ol, ul, li,
		fieldset, form, label, legend,
		table, caption, tbody, tfoot, thead, tr, th, td,
		article, aside, canvas, details, embed,
		figure, figcaption, footer, header, hgroup,
		menu, nav, output, ruby, section, summary,
		time, mark, audio, video {
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 100%;
		font: inherit;
		vertical-align: baseline; }
		
		/* HTML5 display-role reset for older browsers */
		article, aside, details, figcaption, figure,
		footer, header, hgroup, menu, nav, section {
		display: block; }
		
		body {
		line-height: 1; }
		
		ol, ul {
		list-style: none; }
		
		blockquote, q {
		quotes: none; }
		
		blockquote:before, blockquote:after,
		q:before, q:after {
		content: '';
		content: none; }
		
		table {
		border-collapse: collapse;
		border-spacing: 0; }
		
		textarea:focus, button:focus, input:focus {
		outline: none; }
		
		#bg_image {
		height: 100vh;
		background-size: 800px 100vh; }
		
		#content_space {
		position: relative;
		width: 556px;
		margin: 0px auto; }
		
		#subconstent_img {
		height: 60px;
		margin-top: 64px;
		margin-left: 30px; }
		
		#contect_box {
		width: 100%;
		margin-top: 32px;
		border-radius: 14px;
		position: relative;
		background-color: rgba(255, 255, 255, 0.95);
		-webkit-box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.3);
				box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.3); }
		
		#logo_1, #logo_2 {
		display: block;
		margin: 0 60px; }
		
		#logo_1 {
		margin-top: 24px;
		margin-bottom: 12px;
		float: right; }
		
		#logo_2 {
		margin: 0 auto; }
		
		.imput_box {
		width: 100%;
		height: 62px;
		border: 2px solid #C7CED2;
		background-color: #fff;
		border-radius: 8px;
		font-size: 19px;
		padding: 0px 22px;
		margin-bottom: 22px;
		font-family: "Noto Sans CJK KR", "맑은고딕";
		-webkit-box-sizing: border-box;
				box-sizing: border-box; }
		
		.imput_box:focus {
		border-color: #7B858F; }
		
		#logoinbtn {
		width: 100%;
		border-radius: 8px;
		font-size: 19px;
		height: 62px;
		color: rgba(255, 255, 255, 0.6);
		background-color: #0060AF;
		border: none;
		font-family: "Noto Sans CJK KR", "맑은고딕";
		font-weight: bold;
		cursor: pointer; }
		
		#logoinbtn:hover, #logoinbtn:focus {
		color: #fff;
		background-color: #0060AF; }
		
		.linkbtn {
		width: calc(50% - 7px);
		border-radius: 8px;
		padding: 18px 0px;
		font-size: 16px;
		color: #fff;
		display: block;
		font-family: "Noto Sans CJK KR", "맑은고딕";
		text-decoration: none;
		text-align: center; }
		
		.linkbtn_1 {
		margin-right: 14px;
		background-color: #F59E09;
		float: left; }
		
		.linkbtn_1:hover, .linkbtn_1:focus {
		background-color: #DB8D08; }
		
		.linkbtn_2 {
		background-color: #752E87;
		float: left; }
		
		.linkbtn_2:hover, .linkbtn_2:focus {
		background-color: #5F256E; }
		
		#linkbox, #formbox {
		margin: 0 60px; }
		
		#formbox {
		margin-top: 22px; }
		
		#linkbox {
		width: calc(100% - 120px);
		bottom: 34px;
		padding: 22px 0 28px;
		text-align: right;
		font-family: "Noto Sans CJK KR", "맑은고딕";
		font-size: 18px; }
		
		#idsave_box {
		display: none;
		position: relative;
		margin-top: 20px;
		text-align: right; }
		
		#idsave_box label {
		font-size: 19px;
		color: #404040;
		opacity: .6;
		font-family: "Noto Sans CJK KR", "맑은고딕";
		cursor: pointer; }
		
		#idsave_box label:hover, #idsave_box label:focus {
		text-decoration: underline;
		opacity: 1; }
		
		#idsave + label::before {
		cursor: pointer;
		content: ' ';
		display: inline-block;
		width: 20px;
		height: 20px;
		line-height: 21px;
		margin: -2px 8px 0 0;
		text-align: center;
		vertical-align: middle;
		border: 2px solid #707070; }
		
		input::-webkit-input-placeholder {
		color: rgba(64, 64, 64, 0.3); }
		
		input:-ms-input-placeholder {
		color: rgba(64, 64, 64, 0.3); }
		
		input::-ms-input-placeholder {
		color: rgba(64, 64, 64, 0.3); }
		
		input::placeholder {
		color: rgba(64, 64, 64, 0.3); }
		
		#idsave:checked + label::before {
		content: '\2714';
		color: #fff;
		background: #707070; }
		
		#idsave {
		display: none; }
		
		#userposition {
		display: none; }
	</style>
<!--    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->
	<script language='javascript' src='https://kmu.dev.wizian.co.kr/js/jquery-1.11.2.min.js'></script>
    <script language="javascript">

    	var isSending = false; 
        function doLogin(event) {
        	if (isSending) {
        		if (event != null) {
        			event.preventDefault();
        		}
        		
        		return;
        	}
        	isSending = true;
        	
        	if (event != null) {
        		event.preventDefault();
        	}
            var id = document.getElementById("id").value;
            var pwd = document.getElementById("pwd").value;

            if ((!id) || (0 === id.length)) {
                alert("ID를 입력하세요.");
                document.getElementById("id").focus();
				isSending = false;
                return;
            }

            if ((!pwd) || (0 === pwd.length)) {
                alert("비밀번호를 입력하세요.");
                document.getElementById("pwd").focus();
				isSending = false;
                return;
            }
            
            
            //var form = $('#formbox')[0];
            var formData = new FormData();
            var ls_id = $('#id')[0].value;
            var ls_pwd = $('#pwd')[0].value;
            $.ajax({
            	  type : 'POST'
            	, url : '/login.jsp'
            	, data : { id: ls_id, pwd : ls_pwd}
            	//csrf : '1af0987a-0284-4cb5-9771-00f7b0bb0935'
            	, datatype : 'text'
            	/*, enctype: 'multipart/form-data'
            	, processData: true
                , contentType: false
                , cache: false*/
            	, success : function(data, status, xhr) {
            		
            		if (data.indexOf('Login Page') > -1) {
            			var html = $('<div></div>');
            			html.html(data);
            			
            			var text = $('#errorText', html).text();
            			alert(text);
            			
            			location.reload();
            		} else {
            			window.location = '/ps';
            		}
            		
            		
            	}
            	, error : function(xhr, status, err) {
            		if (err == null || err == undefined) {
            			alert('로그인 중 에러가 발생하였습니다.');
            		} else {
            			if (err == '') {
            				alert('로그인 중 에러가 발생하였습니다.');
            			} else {
            				alert(err);
            			}
            		}
            		
            		//alert(err);
            		
            		isSending = false;
            	}
            });
            
            //document.getElementById("formbox").submit();
        };

        function loginenter(event, type) {
            if (event.keyCode == 13) {
            	event.preventDefault();
            	
                //doLogin(event);
                
            } else if (event.keyCode == 8) {
            	
            } else {
            	var ls_id = $('#id')[0].value;
            	ls_id = ls_id.replace(/[^A-Za-z0-9]/g, '');
                //ls_id = ls_id.replace(/[^A-Z0-9]/gi, '');
                //ls_id = ls_id.toUpperCase();
                $('#id')[0].value = ls_id;
            }
        };
        
        //중앙위치 구해오기
		const POPUP_WIDTH = 480,
			  POPUP_HEIGHT = 450,
			  popupX = (window.screen.width / 2) - (POPUP_WIDTH / 2),
			  popupY= (window.screen.height /2) - (POPUP_HEIGHT / 2);
		
        function popup() {
        	window.open("https://kmu.dev.wizian.co.kr/nxweb/SeekPage.do", "a", "width="+POPUP_WIDTH+",height="+POPUP_HEIGHT+",top="+popupY+",left="+popupX+", screenX="+ popupX+", screenY= "+ popupY+", scrollbars=no");
        };
    </script>
</head>
<body onload="onload()">
	<article id="bg_image">
		<div id="subconstent">
		</div>
		<section id="content_space">
		    <div id="contect_box">
				<img id="logo_1" src="https://kmu.dev.wizian.co.kr/images/login/logo-kmu_36.png" alt="경민대학교"/>
                <form id="formbox" name="LoginPage" action="/login/Login.do" method="POST">
                   <div id="userposition">
					   <input class="login_radio_userdiv" type="radio" id="userdiv01" name="userdiv" value="stud"/><label class="login_label_userdiv" for="userdiv01">학생</label>
					   <input class="login_radio_userdiv" type="radio" id="userdiv02" name="userdiv" value="emp" checked/><label class="login_label_userdiv" for="userdiv02">교직원</label>
                   </div>
                    <input class="imput_box" type="text" id="id" name="id" placeholder="ID 입력하세요." value="" onkeyup="loginenter(event, type)" style="ime-mode:disabled">
                    <input class="imput_box" type="password" id="pwd" name="pwd" placeholder="Password 입력하세요." value="" onkeyup="loginenter(event, type)" style="ime-mode:disabled"/>
                    <input type="hidden" id="_csrf" name="_csrf" value="1af0987a-0284-4cb5-9771-00f7b0bb0935" />
                    <button id="logoinbtn" type="submit" onclick="doLogin(event)">LOGIN</button>
                    <p id="idsave_box">
		                <input id="idsave" type="checkbox" value="idsave" name="id_save"/>
                        <label for="idsave">아이디 저장</label>
                    </p>
		        </form>
               <div id="linkbox">
                  <a class="popUp" onclick="popup()">
                  	<img class="popUp" src="https://kmu.dev.wizian.co.kr/images/login/kml_pwd.png"   style="cursor:pointer;"/>
                  </a>
               </div>
		    </div>
		</section>
	</article>
	<p id="errorText"  style="visibility:hidden"></p>
</body>
<script>
	
</script>

<script>
	function onload() {
		document.getElementById("id").focus();
	}
</script>

</html>
