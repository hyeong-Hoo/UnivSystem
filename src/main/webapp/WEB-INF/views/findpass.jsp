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
</head>

<form action="/findpass" method="post">
    <div>
        <div>사용자ID</div>
        <div><input type="text" id="USER_ID" name="USER_ID" placeholder="ID를 입력하세요"></div>
        <div>이름</div>
        <div><input type="text" id="KORN_FLNM" name="KORN_FLNM" placeholder="이름을 입력하세요"></div>
        <div>폰번호</div>
        <div><input type="text" id="TELNO" name="TELNO" placeholder="폰번호를 입력하세요"></div>
        <div><input type="radio" id="sms" name="sms" value="true">SMS발송</div>
         <div><input type="radio" id="none" name="none" value="false">발송은 돈이들어요</div>
        <input type="submit" value="확인">
    </div>
</form>
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
</script>

</body>
</html>