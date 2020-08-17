<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>로그인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script type="text/javascript">
	if (
<%=session.getAttribute("signedUser") != null%>
	) {
		alert("이미 로그인 중 입니다");
		window.location = "index.ws";
	}
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
						<h1>로그인</h1>
					</header>
				</div>
			</section>

		</div>

		<!-- Contact -->
		<section id="contact">
			<form method="post" action="loginPro.ws">
				<div class="inner">
					<div class="fields" style="width: 50%; margin-left: 30%;">
						<div class="field half">
							<label for="id">아이디</label> <input style="width: 90%;" type="text" name="id" id="id" autocomplete="off" />
						</div>
						<div class="field half">
							<label for="pw">비밀번호</label> <input style="width: 90%;" type="password" name="pw" id="pw" autocomplete="off" />
						</div>
						<div style="margin-top: 17px; margin-bottom: 15px;">
							<input type="submit" value="로그인" class="primary" />
						</div>
						<div>
							<%
								String clientId = "Quz0SQXgpUE1GIFObj0j";//애플리케이션 클라이언트 아이디값";
								String redirectURI = URLEncoder.encode("http://localhost:10030/jspProject_1/callback.ws", "UTF-8");
								SecureRandom random = new SecureRandom();
								String state = new BigInteger(130, random).toString();
								String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
								apiURL += "&client_id=" + clientId;
								apiURL += "&redirect_uri=" + redirectURI;
								apiURL += "&state=" + state;
								session.setAttribute("state", state);
							%><a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
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