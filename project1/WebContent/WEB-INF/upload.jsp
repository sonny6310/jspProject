<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>파일 업로드</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	if (<%=session.getAttribute("signedUser") == null%>) {
		alert("로그인 후 이용가능합니다");
		window.location = "login.ws";
	} 
</script>
<script type="text/javascript">
	function checkSize(input) {
		if (input.files && input.files[0].size > (10 * 1024 * 1024)) {
			alert("파일 사이즈가 업로드 최대 용량(10MB)을 초과하였습니다");
			input.value = null;
		} else {
			document.getElementById('file_route').value = input.value
					.split('\\')[input.value.split('\\').length - 1];
		}
	}
</script>
<style>
.file_input label {
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	-moz-transition: background-color 0.2s ease-in-out, box-shadow 0.2s
		ease-in-out, color 0.2s ease-in-out;
	-webkit-transition: background-color 0.2s ease-in-out, box-shadow 0.2s
		ease-in-out, color 0.2s ease-in-out;
	-ms-transition: background-color 0.2s ease-in-out, box-shadow 0.2s
		ease-in-out, color 0.2s ease-in-out;
	transition: background-color 0.2s ease-in-out, box-shadow 0.2s
		ease-in-out, color 0.2s ease-in-out;
	background: transparent;
	border: 0;
	border-radius: 0;
	box-shadow: inset 0 0 0 2px #ffffff;
	color: #ffffff;
	cursor: pointer;
	display: inline-block;
	font-size: 0.8em;
	font-weight: 600;
	height: 3.5em;
	letter-spacing: 0.25em;
	line-height: 3.5em;
	padding: 0 1.75em;
	text-align: center;
	text-decoration: none;
	text-transform: uppercase;
	white-space: nowrap;
	width: 9em;
}

.file_input label:hover, .file_input label:active {
	box-shadow: inset 0 0 0 2px #9bf1ff;
	color: #9bf1ff;
	background-color: rgba(155, 241, 255, 0.1);
	box-shadow: inset 0 0 0 2px #53e3fb;
	color: #53e3fb;
}

.file_input label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}

.file_input input[type=text] {
	vertical-align: middle;
	display: inline;
}
</style>
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
					<h1>파일 업로드</h1>
				</header>
			</div>
		</section>

		<br />

		<!-- Contact -->
		<section id="contact">
			<form action="uploadPro.ws" method="post" enctype="multipart/form-data">
				<div class="inner">
					<div class="fields" style="width: 50%; margin-left: 30%;">
						<div class="error">${inserterror }${uploaderror }</div>
						<div class="field">
							<label class="test" for="title">제목</label> <input style="width: 90%;" type="text" name="title" id="title" autocomplete="off" />
						</div>
						<div class="field">
							<label class="test" for="file">파일 첨부 (10MB 이하)</label>
							<div class="file_input">
								<label> 파일선택 <input type="file" name="file" id="file" onchange="checkSize(this)">
								</label> <input style="width: calc(90% - 7.4em);" type="text" readonly="readonly" title="File Route" name="file_route" id="file_route">
							</div>
						</div>
						<div class="field">
							<label for="content">내용</label>
							<textarea style="width: 90%; resize: none;" name="content" id="content" rows="6" autocomplete="off"></textarea>
						</div>
						<div style="margin-top: 17px;">
							<input id="submit" type="submit" value="업로드" class="primary" /> <input type="reset" value="리셋" />
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