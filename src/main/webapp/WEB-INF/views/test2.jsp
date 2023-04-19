<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="asset/jQuery/jquery-1.12.4.min.js"></script>
<script src="asset/js/index.js"></script>
</head>
<style>
.mainbox {
	width: 800px;
	height: 50px;
	border: 1px solid black;
	border-collapse: collapse;
	position: relative;
}

.subbox {
	border: 1px solid black;
}

.scroll {
	width: 800px;
	height: 450px;
	overflow: scroll;
}

.tr_a {
	width: 1350px; 
	height : 50px;
	text-align: center;
	line-height: 50px;
	border: 1px solid black;
	height: 50px;
}

.td_a {
	height: 50px;
	text-align: center;
	line-height: 50px;
	border: 1px solid black;
}
.td_a1 {
	height: 50px;
	text-align: center;
	line-height: 50px;
	border: 1px solid black;
}
.mainbox>tbody>tr>td:nth-child(1){
border: none;
}
.sticky {
	position: fixed;
	width: 94px;
}
</style>
<script type="text/javascript">
	function open3() {
		window
				.open("http://localhost/pdf", "_blank",
						"width=1000, height=1000");
	}
</script>
<div class="scroll">
	<table class="mainbox">
		<thead>
			<tr class="tr_a ">
				<th class="td_a">수험번호</th>
				<th class="td_a">이름</th>
				<th class="td_a">석차</th>
				<th class="td_a">생년월일</th>
				<th class="td_a">지망학과</th>
				<th class="td_a">휴대폰번호</th>
				<th class="td_a">최종학력</th>
				<th class="td_a">합격구분</th>
				<th class="td_a">pdf보기</th>
			</tr>
		</thead>
		<tbody>
			<tr class="tr_a1 ">
				<td class="td_a sticky ">수험번호</td>
				<td class="td_a">이름</td>
				<td class="td_a">석차</td>
				<td class="td_a">생년월일</td>
				<td class="td_a">지망학과</td>
				<td class="td_a">휴대폰번호</td>
				<td class="td_a">최종학력</td>
				<td class="td_a">합격구분</td>
				<td class="td_a"><input type="button" onclick="open3()"
					value="pdf보기" /></td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>