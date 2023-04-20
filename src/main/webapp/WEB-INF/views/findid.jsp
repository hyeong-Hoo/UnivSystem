<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
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
</head>
<body>
<form action="/findid" method="post" onsubmit="return fnSubmit();">
    <div>
      <div>Name</div>
      <div><input type="text" id="KORN_FLNM" name="KORN_FLNM" placeholder="Enter name..."></div>
      <div>Tel number</div>
      <div><input type="text" id="TELNO" name="TELNO" placeholder="Enter phone..."></div>
      <div><input type="submit" value="Search"></div>
    </div>
  </form>



</body>
</html>