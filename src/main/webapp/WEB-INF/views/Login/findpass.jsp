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
      <h4>여기는<span>  Cau</span></h4>
      <p>비밀번호를 잃어버리셧다면 지금 당장 찾으십쇼</p>
       <div class="floating-label">
        <input placeholder="사용자ID" type="text" name="USER_ID" id="USER_ID" autocomplete="off" class="aim">
        <label for="email">사용자ID</label>
      </div>
      <div class="floating-label">
        <input placeholder="이름" type="text" name="KORN_FLNM" id="KORN_FLNM" autocomplete="off" class="aim">
        <label for="email">이름</label>
      </div>
      <div class="floating-label">
        <input placeholder="핸드폰번호" type="text" name="TELNO" id="TELNO" autocomplete="off" class="aim">
        <label for="password">핸드폰번호</label>
      </div>
       <div><input type="radio" id="sms" name="sms" value="true" class="">SMS발송</div>
       <div><input type="radio" id="none" name="none" value="false" class="">발송은 돈이들어요</div>
      <div><input type="submit" class="button" value="찾기" class="aim"></div>
      <a href="/Login/findid" class="discrete" >아이디찾기</a>
    </form>
  </div>


<script>
    function validateForm() {
        var smsChecked = document.getElementById("sms").checked;
        var noneChecked = document.getElementById("none").checked;
        
        if (!smsChecked && !noneChecked) {
            alert("발송 방법을 선택해주세요.");
            return false;
        }
        
        return true;
    }
    
    $(document).ready(function() {
        $("form").submit(function(event) {
            return validateForm();
        });
    });
    
    $(document).ready(function() {
        $("input[name='sms']").click(function() {
            $("input[name='none']").prop("checked", false);
        });
        
        $("input[name='none']").click(function() {
            $("input[name='sms']").prop("checked", false);
        });
    });

</script>





</body>
</html>