<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	if (<%=session.getAttribute("signedUser") != null%>) {
		alert("이미 로그인 중 입니다");
		window.location = "index.ws";
	} 
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var re1 = /^[a-z][a-z0-9]{6,15}$/; // 아이디가 적합한지 검사할 정규식. 첫글자는 무조건 영어소문자, 7~16자리 영어소문자와 숫자만 가능
		var re2 = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,16}$/; // 비밀번호가 적합한지 검사할 정규식. 8~16자리로 영어 소문자, 숫자, 특수문자가 각각 최소 1개 이상.
		var re3 = /^[가-힣]{2,4}$/; // 한글 2~4자
		var re4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식

		$("#id").on("blur", function() {
			var id = $("#id").val();
			if(id.length < 7 || id.length > 16){
				$("#id_check").text("아이디는 7자~16자이어야 합니다.");
				$("#id_check").css("color", "salmon");
				$("#id_check").css("margin-left", "24%");
			}else{
				$.ajax({
					type : "get",
					url : "checkID.ws?id=" + id,
					success : function(data) {
						if (data == 1) {
							if(re1.test(id)){
								$("#id_check").text("사용가능한 아이디입니다.");
								$("#id_check").css("color", "skyblue");
								$("#id_check").css("margin-left", "28%");
							}else{
								$("#id_check").text("불가능한 아이디입니다.");
								$("#id_check").css("color", "salmon");
								$("#id_check").css("margin-left", "29%");
							}
						} else {
							$("#id_check").text("중복된 아이디가 있습니다.");
							$("#id_check").css("color", "salmon");
							$("#id_check").css("margin-left", "27%");
						}
					}
				});
			}
		});
		
		$("#pw").on("blur", function(){
			var pw = $("#pw").val();
			if(pw.length < 8 || pw.length > 16){
				$("#pw_check").text("비밀번호는 8자~16자이어야 합니다.");
				$("#pw_check").css("color", "salmon");
				$("#pw_check").css("margin-left", "23%");
			} else{
				if(re2.test(pw)){
					$("#pw_check").text("OK");
					$("#pw_check").css("color", "skyblue");
					$("#pw_check").css("margin-left", "41%");
				} else{
					$("#pw_check").text("영어 소문자, 숫자, 특수문자가 각각 최소 1개 이상이어야 합니다.");
					$("#pw_check").css("color", "salmon");
					$("#pw_check").css("margin-left", "5%");
				}
			}
		});
		
		$("#name").on("blur", function(){
			var name = $("#name").val();
			if(re3.test(name)){
				$("#name_check").text("OK");
				$("#name_check").css("color", "skyblue");
				$("#name_check").css("margin-left", "41%");
			} else {
				$("#name_check").html("한글이름 2~4자이어야 합니다.");
				$("#name_check").css("color", "salmon");
				$("#name_check").css("margin-left", "25%");
			}
		});
		
		$("#email").on("blur", function(){
			var email = $("#email").val();
			if(re4.test(email)){
				$("#email_check").text("OK");
				$("#email_check").css("color", "skyblue");
				$("#email_check").css("margin-left", "41%");
			} else{
				$("#email_check").text("이메일 양식에 맞게 작성해야합니다.");
				$("#email_check").css("color", "salmon");
				$("#email_check").css("margin-left", "23%");
			}
		});
		
		$("#submit").on("click", function(){
			$("#submit").attr("type", "button");
			if ($("#id_check").text().trim() != "사용가능한 아이디입니다."){
				$("#id").focus();
			} else if($("#pw_check").text().trim() != "OK"){
				$("#pw").focus();
			} else if($("#name_check").text().trim() != "OK"){
				$("#name").focus();
			} else if($("#email_check").text().trim() != "OK"){
				$("#email").focus();
			} else {
				$("#submit").attr("type", "submit");
			}
		})	
	});
</script>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<a href="index.ws" class="logo"><strong>홈</strong> <span>바로가기</span></a>
			<nav>
				<a href="#menu">메뉴</a>
			</nav>
		</header>

		<!-- Menu -->
		<%@ include file="../META-INF/resources/menu.jsp"%>

		<!-- Main -->
		<div id="main" class="alt">

			<!-- One -->
			<section id="one">
				<div class="inner">
					<header class="major">
						<h1>회원가입</h1>
					</header>
				</div>
			</section>
		</div>

		<!-- Contact -->
		<section id="contact">
			<form name="signupForm" method="post" action="signupPro.ws">
				<div class="inner">
					<div class="fields" style="width: 50%; margin-left: 30%;">
						<div class="field">
							<label class="test" for="id">아이디</label> <input style="width: 90%;" type="text" name="id" id="id" autocomplete="off" />
							<div id="id_check"></div>
						</div>
						<div class="field">
							<label for="pw">비밀번호</label> <input style="width: 90%;" type="password" name="pw" id="pw" autocomplete="off" />
							<div id="pw_check"></div>
						</div>
						<div class="field">
							<label for="name">이름</label> <input style="width: 90%;" type="text" name="name" id="name" autocomplete="off" />
							<div id="name_check"></div>
						</div>
						<div class="field">
							<label for="email">Email</label> <input style="width: 90%;" type="text" name="email" id="email" autocomplete="off" />
							<div id="email_check"></div>
						</div>
						<div style="margin-top: 17px;">
							<input id="submit" type="button" value="가입" class="primary" /> <input type="reset" value="리셋" />
						</div>
					</div>
				</div>
			</form>
		</section>

		<!-- Footer -->
		<%@ include file="../META-INF/resources/footer.jsp"%>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>