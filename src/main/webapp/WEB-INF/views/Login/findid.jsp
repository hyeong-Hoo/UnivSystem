<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"></script>
<html>


<script>
// var path = "${pageContext.request.contextPath }";
 
// $(document).ready(function() {
// var msg = "${msg}";
// if(msg != ""){
// alert(msg);    
// }
// });
 
 
// function fnSubmit() {
 
// //var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;
 
// if ($("#name").val() == null || $("#name").val() == "") {
// alert("이름을 입력해주세요.");
// $("#name").focus();
 
// return false;
// }
 
// if ($("#phone").val() == null || $("#phone").val() == "") {
// alert("전화번호를 입력해주세요.");
// $("#phone").focus();
 
// return false;
// }
 
// if(!tel_rule.test($("#phone").val())){
// alert("전화번호 형식에 맞게 입력해주세요.");
// return false;
// }
 
 
//if (confirm("아이디를 찾으시겠습니까?")) {
 
//$("#createForm").submit();
 
//return false;
//}
// }
 
</script>
<head>
<meta charset="UTF-8">
<title>user</title>
<link rel="stylesheet" type="text/css" href="/css/IdFind.css">


</head>






<body>
  <div class="session">
    <div class="left">
      <?xml version="1.0" encoding="UTF-8"?>
      <svg enable-background="new 0 0 300 302.5" version="1.1" viewBox="0 0 300 302.5" xml:space="preserve" xmlns="http://www.w3.org/2000/svg">
<style type="text/css">
	.st0{fill:#fff;}
</style>
</svg>      
    </div>
    <form action="/findid" method="post" class="log-in" autocomplete="off" onsubmit="return fnSubmit();"> 
      <h4>여기는<span>  Cau</span></h4>
      <p>아이디를 잃어버리셧다면 지금 당장 찾으십쇼</p>
      <div class="floating-label">
        <input placeholder="이름" type="text" name="KORN_FLNM" id="KORN_FLNM" autocomplete="off" class="aim">
        <label for="email">이름</label>
      </div>
      <div class="floating-label">
        <input placeholder="핸드폰번호" type="text" name="TELNO" id="TELNO" autocomplete="off" class="aim">
        <label for="password">핸드폰번호</label>
      </div>
      <div><input type="submit" class="button" value="찾기" class="aim" ></div>
      <a href="/Login/findpass" class="discrete" >비밀번호 찾기</a>
    </form>
  </div>
</body>



<script type="text/javascript">

	function cfCheckLengthAndBlur(obj, len) {
		if (obj.value.length == len) {
			obj.blur();
		}
	}

	// 휴대폰 인증번호 발송
	function jfSendMobileCertNo() {
		if (ngjfIsNull($('#MOBILE2').val())) {
			alert("휴대폰 번호를 입력해 주세요.");
			$('#MOBILE2').focus();
			return;
		}

		if ($('#MOBILE2').val().length < 3) {
			alert("휴대폰 번호를 확인해 주세요.");
			$('#MOBILE2').select();
			$('#MOBILE2').focus();
			return;
		}

		if (ngjfIsNull($('#MOBILE3').val())) {
			alert("휴대폰 번호를 입력해 주세요.");
			$('#MOBILE3').focus();
			return;
		}

		if ($('#MOBILE3').val().length < 4) {
			alert("휴대폰 번호를 확인해 주세요.");
			$('#MOBILE3').select();
			$('#MOBILE3').focus();
			return;
		}

		var params = new Object();
		params.MEM_NM = $('#MEM_NM').val();
		params.BIRTH_DT_YYYY = $('#BIRTH_DT_YYYY').val();
		params.BIRTH_DT_MM = $('#BIRTH_DT_MM').val();
		params.BIRTH_DT_DD = $('#BIRTH_DT_DD').val();
		params.MOBILE1 = $('#MOBILE1').val();
		params.MOBILE2 = $('#MOBILE2').val();
		params.MOBILE3 = $('#MOBILE3').val();
		params.CERTNO_SEND_GB = 'ID_FIND'; // 인증번호발송구분(ID_FIND: 아이디(E-MAIL) 찾기)

		ngjfAjaxSubmit("/member.do?cmd=sendMobileCertNoAjax", "json", jfSendMobileCertNoAfterProcess, params);
	}

	// 휴대폰 인증번호 발송 후처리
	function jfSendMobileCertNoAfterProcess(result) {
		if (result.RESULT == "NOT_FOUND") {
			alert('일치하는 회원정보가 없습니다.');
			return;
		}

		if (ngjfIsNull(result.SMS_CERT_NO)) {
			alert('인증번호 전송에 실패했습니다.');
			return;
		}

		alert('입력하신 번호로 인증번호가 전송되었습니다.\n인증번호 확인 후 입력해 주세요.');
		$('#input').css("display", "");
		$('#CERT_NUM').css("display", "none");
		$('#CERT_NUM_RE').css("display", "");

		// timer start
		getStartclock();
		getShowtime(1);
	}

	// 확인 -> 현재는 안씀
	function jfConfirm() {
		if (ngjfIsNull($('#MEM_NM').val())) {
			alert("이름을 입력해 주세요");
			$('#MEM_NM').focus();
			return;
		}

		var korNameRegexp = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
		if (korNameRegexp.test($('#MEM_NM').val())) {
			alert("이름을 한글로 입력해 주세요.");
			$('#MEM_NM').focus();
			return;
		}

		if ($('#MEM_NM').val().length < 2 || $('#MEM_NM').val().length > 5) {
			alert("이름을 2자 이상 5자 이하로 입력해 주세요.");
			$('#MEM_NM').focus();
			return;
		}

		if (ngjfIsNull($('#BIRTH_DT_YYYY').val())) {
			alert("생년월일 연도를 선택해 주세요.");
			$('#BIRTH_DT_YYYY').focus();
			return;
		}

		if (ngjfIsNull($('#BIRTH_DT_MM').val())) {
			alert("생년월일 월을 선택해 주세요.");
			$('#BIRTH_DT_MM').focus();
			return;
		}

		if (ngjfIsNull($('#BIRTH_DT_DD').val())) {
			alert("생년월일 일자를 선택해 주세요.");
			$('#BIRTH_DT_DD').focus();
			return;
		}

		if (ngjfIsNull($('#MOBILE2').val())) {
			alert("휴대폰 번호를 입력해 주세요.");
			$('#MOBILE2').focus();
			return;
		}

		if ($('#MOBILE2').val().length < 3) {
			alert("휴대폰 번호를 확인해 주세요.");
			$('#MOBILE2').select();
			$('#MOBILE2').focus();
			return;
		}

		if (ngjfIsNull($('#MOBILE3').val())) {
			alert("휴대폰 번호를 입력해 주세요.");
			$('#MOBILE3').focus();
			return;
		}

		if ($('#MOBILE3').val().length < 4) {
			alert("휴대폰 번호를 확인해 주세요.");
			$('#MOBILE3').select();
			$('#MOBILE3').focus();
			return;
		}

		if (ngjfIsNull($('#SMS_CERT_NO').val())) {
			alert("인증번호를 입력해주세요.");
			$('#SMS_CERT_NO').focus();
			return;
		}

		if ($('#time_chk').val() == "N") {
			alert("인증번호 입력시간이 초과했습니다.");
			return;
		}

		var params = new Object();
		params.CERT_NO = $('#SMS_CERT_NO').val();

		ngjfAjaxSubmit("/common.do?cmd=checkCertNo", "json", jfConfirmAfterProcess, params);
	}

	// 확인 후처리
	function jfConfirmAfterProcess(result) {
		if (result.IS_CERT_OK == true) {
			$('#memberForm').prop('action', _lsnWebUrl + '/member.do?cmd=getMemberIdFindResult');
			$('#memberForm').submit();
		} else {
			alert('인증번호가 일치하지 않습니다.\n확인 후 다시 입력해 주세요.');
			return;
		}
	}

	/* 시간타이머 처리 ********************************************************************/
	var timerID = null;
	var timerRunning = false;
	var AddMinute = 5;	//5분지정
	var Qdate = null;

	function getStartclock() {
		getStopclock();
	}

	function getStopclock() {
		if (timerRunning) clearTimeout(timerID);

		Qdate = new Date();
		var Adate = Qdate.getTime() + 60 * AddMinute * 1000;
		Qdate.setTime(Adate);
		timerRunning = false;
	}

	function getShowtime(gubun) {
		now = new Date();
		var nt = now.getTime();
		var et = Qdate.getTime();
		sec = parseInt(et - nt) / 1000;
		day = parseInt(sec / 60 / 60 / 24);
		sec = (sec - (day * 60 * 60 * 24));
		hour = parseInt(sec / 60 / 60);
		sec = (sec - (hour * 60 * 60));
		min = parseInt(sec / 60);
		sec = parseInt(sec - (min * 60));

		var Minuteleft = min;
		var Secondleft = sec;

		if (gubun == 1) {
			var obj = document.getElementById('time');
			var objchk = document.getElementById('time_chk');
		}
		if (gubun == 2) {
			var obj = document.getElementById('time');
			var objchk = document.getElementById('kmcert_time_chk');
		}

		if ((Qdate.getTime() - now.getTime()) > 0) {
			var leftStr = "남은시간 ";
			if (Minuteleft > 0) leftStr += min + " : ";
			leftStr += sec;
			obj.innerHTML = leftStr;
			if (gubun == 1) {
				objchk.value = "Y";
			}
		} else {
			obj.innerHTML = '(입력시간 초과)';
			objchk.value = "N";
		}

		now = null;
		timerID = setTimeout("getShowtime(" + gubun + ")", 1000);
		timerRunning = true;
	}

	//비밀번호찾기(회원정보인증방식) - 시간연장
	function jfPwTimeExtension() {
		if ($('#kmcert_time_chk').val() == "Y") {
			if (!confirm("남은시간 연장은 1회만 제공합니다. 남은시간을 연장하시겠습니까?"))
				return;

			getStartclock();	//5분 타이머 작동
			getShowtime(2);
			$('#kmcert_time_chk').val('N');

		} else {
			alert("더이상 시간을 연장하실 수 없습니다.")
			return;
		}
	}

	//기존 회원정보가 있는지 확인
	function jfCheckMobile() {
		if (ngjfIsNull($('#MEM_NM').val())) {
			alert("이름을 입력해 주세요");
			$('#MEM_NM').focus();
			return;
		}

		var korNameRegexp = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
		if (korNameRegexp.test($('#MEM_NM').val())) {
			alert("이름을 한글로 입력해 주세요.");
			$('#MEM_NM').focus();
			return;
		}

		if ($('#MEM_NM').val().length < 2 || $('#MEM_NM').val().length > 5) {
			alert("이름을 2자 이상 5자 이하로 입력해 주세요.");
			$('#MEM_NM').focus();
			return;
		}

		if (ngjfIsNull($('#MOBILE2').val())) {
			alert("휴대폰 번호를 입력해 주세요.");
			$('#MOBILE2').focus();
			return;
		}

		if ($('#MOBILE2').val().length < 3) {
			alert("휴대폰 번호를 확인해 주세요.");
			$('#MOBILE2').select();
			$('#MOBILE2').focus();
			return;
		}

		if (ngjfIsNull($('#MOBILE3').val())) {
			alert("휴대폰 번호를 입력해 주세요.");
			$('#MOBILE3').focus();
			return;
		}

		if ($('#MOBILE3').val().length < 4) {
			alert("휴대폰 번호를 확인해 주세요.");
			$('#MOBILE3').select();
			$('#MOBILE3').focus();
			return;
		}

		var params = new Object();
		params.MOBILE1 = $('#MOBILE1').val();
		params.MOBILE2 = $('#MOBILE2').val();
		params.MOBILE3 = $('#MOBILE3').val();
		params.MEM_NM = $('#MEM_NM').val();

		ngjfAjaxSubmit("/member.do?cmd=getMemberInfoUsingMobileAjax", "json", jfCheckMobileAfterProcess, params);
	}

	//기존 회원정보가 있는지 확인 - 후처리
	function jfCheckMobileAfterProcess(result) {
		// 회원상태
		// CAN_JOIN: 가입 가능(기존 회원정보 없음)
		// EXIST: 기존 회원정보 존재(탈퇴 안 함)
		// CAN_REJOIN: 재가입 가능(기존 회원정보 있으나 탈퇴 후 2개월이 지났음)
		// CANNOT_REJOIN: 재가입 불가(기존 회원정보 있고 탈퇴 후 2개월이 안 지났음)
		var memState = result.MEM_STATE;

		// 가입이 가능하면(기존 회원정보 없음)
		// 기존 회원정보 존재하고 탈퇴 후 2개월이 안 지났음. 재가입 불가 안내
		if (memState == 'CAN_JOIN' || memState == 'CAN_REJOIN' || memState == 'CANNOT_REJOIN') {
			alert("회원 정보가 존재하지 않습니다.");
		}

		// 기존 회원정보 존재(탈퇴 안 함). 기존 가입정보 안내
		if (memState == 'EXIST') {
			$('#memberForm').prop('action', _lsnWebUrl + '/member.do?cmd=getMemberIdFindResult');
			$('#memberForm').submit();
		}
	}
</script>


		
</body>
</html>