<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집요강</title>
<style type="text/css">
body{
margin: 0;
padding: 0;

}
.box{
background-color: white;
width: 100%;
height: 100vh;
}
.btn_box{
width: inherit;
height: 40px;
background-color: green;
text-align: center;
}
.select_box{
width: inherit;
height: 40px;
background-color: skyblue;
}
.btn{
margin: 5px 10px 0 0;
float: right;
width:60px;
height:30px;
background-color: black;
text-align: center;
line-height: 20px;
font-size: 15px;
}
</style>
</head>
<body>
<div class="box">
	<div class="btn_box">
		<button type="button" class="btn" id="check">조회</button>
		<button type="button" class="btn" id="save">저장</button>
	</div>
	<div class="select_box">
		<select></select>
		<select></select>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>모집학과</th>
					<th>입학정원</th>
					<th>최초인원</th>
					<th>추가인원</th>
					<th>선발인원</th>
					<th>합격인원</th>
					<th>예비인원</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>