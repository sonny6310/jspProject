<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>개인 클라우드</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt">
			<a href="index.ws" class="logo"><strong>홈</strong> <span>바로가기</span></a>
			<nav>
				<a href="#menu">메뉴</a>
			</nav>
		</header>

		<!-- Menu -->
		<%@ include file="../META-INF/resources/menu.jsp"%>

		<!-- Banner -->
		<section id="banner" class="major">
			<div class="inner">
				<header class="major">
					<h1>JSP Project</h1>
				</header>
				<div class="content">
					<p>개인 클라우드 비스무리하게 대충 그냥</p>
					<ul class="actions">
						<li><a href="#one" class="button next scrolly">시작</a></li>
					</ul>
				</div>
			</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one" class="tiles">
				<article>
					<span class="image"> <img src="images/pic01.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="upload.ws" class="link">파일 업로드</a>
						</h3>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/pic02.jpg" alt="" />
					</span>
					<header class="major"> </header>
				</article>
				<article>
					<span class="image"> <img src="images/pic03.jpg" alt="" />
					</span>
					<header class="major"> </header>
				</article>
				<article>
					<span class="image"> <img src="images/pic04.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="mycloud.ws" class="link">내 클라우드</a>
						</h3>
					</header>
				</article>
			</section>
		</div>

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