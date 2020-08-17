<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>글 읽기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script type="text/javascript">
	if (<%=session.getAttribute("signedUser") == null%>) {
		alert("로그인 후 이용가능합니다");
		window.location = "login.ws";
	} 
</script>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<!-- Note: The "styleN" class below should match that of the banner element. -->
		<header id="header" class="alt style1">
			<a href="index.ws" class="logo"><strong>홈</strong> <span>바로가기</span></a>
			<nav>
				<a href="#menu">메뉴</a>
			</nav>
		</header>

		<!-- Menu -->
		<%@ include file="../META-INF/resources/menu.jsp"%>

		<!-- Banner -->
		<!-- Note: The "styleN" class below should match that of the header element. -->
		<section id="banner" class="style1">
			<div class="inner">
				<span class="image"> <img src="images/pic07.jpg" alt="" />
				</span>
				<header class="major">
					<h1>글 읽기</h1>
				</header>
			</div>
		</section>

		<br />

		<!-- Contact -->
		<section id="contact">
			<form method="post" name="form">
				<div class="inner">
					<div class="fields" style="width: 50%; margin-left: 30%;">
						<div class="field">
							<label class="test" for="title">제목</label> <input style="width: 90%;" type="text" name="title" id="title" value="${cDTO.title }" autocomplete="off" readonly />
						</div>
						<div class="fiWeld">
							<label class="test" for="filename">첨부파일</label> <input style="width: 90%;" type="text" name="filename" id="filename" value="${cDTO.filename }" autocomplete="off" readonly />
						</div>
						<div class="field">
							<label class="test" for="filesize">파일크기</label> <input style="width: 90%;" type="text" name="filesize" id="filesize" value="${cDTO.filesize }" autocomplete="off" readonly />
						</div>
						<div class="field">
							<label class="test" for="upload_date">업로드 날짜</label> <input style="width: 90%;" type="text" name="upload_date" id="upload_date" value="${cDTO.upload_date }" autocomplete="off" readonly />
						</div>
						<div class="field">
							<label class="test" for="reg_date">최종 수정일</label> <input style="width: 90%;" type="text" name="reg_date" id="reg_date" value="${cDTO.reg_date }" autocomplete="off" readonly />
						</div>
						<div class="field">
							<label for="content">내용</label>
							<textarea style="width: 90%; resize: none;" name="content" id="content" rows="6" autocomplete="off" readonly>${cDTO.content }</textarea>
						</div>
						<div class="field" style="width: 90%;">
							<input type="button" value="뒤로" class="back primary" onclick="history.go(-1); return false;"> <input style="float: right; margin-left: 1em;" type="button" value="삭제" class="delete" onclick="javascript: var check=confirm('정말로 삭제하시겠습니까?'); if(check==true){form.action='deletePro.ws'; submit();}"> <input style="float: right;" type="submit" value="수정" class="update" onclick="javascript: form.action='update.ws'">
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