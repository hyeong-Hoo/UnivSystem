<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		$(".menu").click(function() {
							var divid = $(this).attr('id');
							var btnid = "btn" + divid;
							var menuid = "menu" + divid;
							var contentid = "content" + divid;
							var btn = "<div class='tap'><span class='barmenu'"+"id="+menuid+"></span><input class='closebtn' type='button' value='x'"+"id="+btnid+"></div>";
							var content = "<div class='content'"+"id="+contentid+"></div>"
									$.ajax({
										url : "/test",
										type : "post",
										cache : false,
										dataType : "html",
										data : {id : divid},
										success : function(good) {
											$("#" + contentid).load(good);
										}
									});
							if ($("#"+contentid).length) {
								$("#" + contentid).remove();
								$("#content").append(content);
							} else {
								$("#content").append(content);
							}
								if ($("#" + menuid).length) {
									
								} else {
									$("#menubar").append(btn);
									$("#" + menuid).text($(this).text());
								}
								$("#"+menuid).click(function() {
									$.ajax({
										url : "/test",
										type : "post",
										cache : false,
										dataType : "html",
										data : {id : divid},
										success : function(good) {
											$("#" + contentid).load(good);
										}
									});
									if ($("#"+contentid).length) {
										$("#" + contentid).remove();
										$("#content").append(content);
									} else {
										$("#content").append(content);
									}
									
								});
								$(document).on("click", "#"+btnid,
										function() {
											$(this).parent().remove();
											$("#" + contentid).remove();
										});
						});

	});
</script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

span {
	display: block;
}

.menubox {
	width: 200px;
	height: 100vh;
	background-color: black;
	float: left;
}

.box {
	float: left;
	width: calc(100% - 200px);
	height: 100vh;
	overflow: hidden;
}

.menu {
	text-align: center;
	line-height: 50px;
	color: white;
	width: 200px;
	height: 50px;
	border-bottom: 1px solid white;
}

.menu:hover {
	background-color: white;
	color: black;
	cursor: pointer;
}

.head {
	width: inherit;
	height: 20vh;
	background-color: skyblue;
}

.menubar {
	width: inherit;
	height: 5vh;
	background-color: blue;
}

.contentbox {
	width: inherit;
	height: 75vh;
	position: relative;
}

.barmenu {
	float: left;
	color: white;
}
.closebtn {
	float: left;
}

.content {
	width: inherit;
	height: inherit;
	position: absolute;
	background-color: white;
}
</style>
</head>

<body>
	<div class="menubox">
		<span class="menu" id="1">메뉴1</span> 
		<span class="menu" id="2">메뉴2</span>
		<span class="menu" id="3">메뉴3</span>
	</div>
	<div class="box">
		<div class="head"></div>
		<div class="menubar" id="menubar"></div>
		<div class="contentbox" id="content"></div>
	</div>
</body>
</html>