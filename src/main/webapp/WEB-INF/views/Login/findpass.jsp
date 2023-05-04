<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<html>



 
</script>
<head>
<meta charset="UTF-8">
<title>find</title>
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
    
    
    
    <form action="/findpass" method="post" class="log-in" autocomplete="off" onsubmit="return fnSubmit();"> 
      <h4><span>  Cau</span>비밀번호 찾는 공간입니다.</h4>
      <p>ID , 본인성명 , 핸드폰 번호를   입력해주세요.</p>
       <div class="floating-label">
        <input placeholder="사용자ID" type="text" name="USER_ID" id="USER_ID_ps" autocomplete="off" class="aim">
        <label for="email">사용자ID</label>
      </div>
      <div class="floating-label">
        <input placeholder="이름" type="text" name="KORN_FLNM" id="KORN_FLNM_ps" autocomplete="off" class="aim">
        <label for="email">이름</label>
      </div>
      <div class="floating-label">
        <input placeholder="핸드폰번호" type="text" name="TELNO" id="TELNO_ps" autocomplete="off" class="aim">
        <label for="password">핸드폰번호</label>
      </div>
       <div><input type="radio" id="sms" name="sms" value="true" class="">SMS발송</div>
       <div><input type="radio" id="im" name="none" value="false" class="">발송은 돈이들어요</div>
      <div><input type="submit" class="button" value="찾기" class="aim"></div>
<!--       <a href="/findid" class="discrete" >아이디찾기</a> -->
      	          <a onclick="openModal()" class="discrete" >아이디 찾기</a>
      
    </form>
  </div>


<script>
document.querySelector('form').addEventListener('submit', function(event) {
    var smsChecked = document.getElementById("sms").checked;
    var imChecked = document.getElementById("im").checked;

    if (!smsChecked && !imChecked) {
        alert("발송 방법을 선택해주세요.");
        return false;
    } else if (smsChecked) {
        imChecked = false;
    } else if (imChecked) {
        smsChecked = false;
    }
    
    return true;
});

    

</script>


</body>
</html>