<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdf 테스트</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
  
<script>

	function toBase64(event) {
		var reader = new FileReader();
		reader.readAsDataURL(event.target.files[0]);
		reader.onload = function(event) {
			var base64 = event.target.result.split(',')[1]; // data URI 스키마 제거
			
			// AJAX 요청 보내기
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "/saves", true);
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
					// 요청이 성공적으로 처리되었을 때의 동작
					console.log("File uploaded successfully.");
				}
			};
			xhr.send("base64=" + encodeURIComponent(base64));
		};
	}
</script>

</head>
<body>
	<input type="file" onchange="toBase64(event);" >
</body>
</html>
