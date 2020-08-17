<%@page import="com.org.value.ConValues"%>
<%@page import="java.util.List"%>
<%@page import="com.org.cloud.CloudDAO"%>
<%@page import="com.org.cloud.CloudDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<CloudDTO> list = (List<CloudDTO>) request.getAttribute("list");
%>
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>내 클라우드</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style>
div.inner {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

h3.title:hover {
	background-color: #e7b788;
	cursor: pointer;
}
</style>

<!-- jquery쓰려면 필요 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	if (
<%=session.getAttribute("signedUser") == null%>
	) {
		alert("로그인 후 이용가능합니다");
		window.location = "login.ws";
	}
</script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(".trrd").attr("style", "display:none;");

				$(".title").on("click", function() {
					var i = $(this).attr("id");
					var reg_date = $(".rd" + i).text();
					window.location = "content.ws?reg_date=" + reg_date;
				});

				$(".download").on(
						"click",
						function() {
							var i = $(this).attr("id");
							var filename = $(".fn" + i).text();
							var upload_date = $(".ud" + i).text();
							window.location = "download.ws?filename="
									+ filename + "&upload_date=" + upload_date;
						});
				
				var pgN = '<%=request.getAttribute("pageNum")%>';
				$(".page" + pgN).css("color", "gray");
			})
</script>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<!-- Note: The "styleN" class below should match that of the banner element. -->
		<header id="header" class="alt style4">
			<a href="index.ws" class="logo"><strong>홈</strong> <span>바로가기</span></a>
			<nav>
				<a href="#menu">메뉴</a>
			</nav>
		</header>

		<!-- Menu -->
		<%@ include file="../META-INF/resources/menu.jsp"%>

		<!-- Banner -->
		<!-- Note: The "styleN" class below should match that of the header element. -->
		<section id="banner" class="style4">
			<div class="inner">
				<span class="image"> <img src="images/pic07.jpg" alt="" />
				</span>
				<header class="major">
					<h1>내 클라우드</h1>
				</header>
			</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one">
				<div class="inner">
					<header class="major">
						<h2>업로드 목록</h2>
					</header>
				</div>
			</section>

			<!-- Two -->
			<form style="margin-bottom: 0;">
				<section id="two" class="spotlights">
					<%
						if (!(list == null)) {
							for (int i = 0; i < list.size(); i++) {
								CloudDTO cDTO = list.get(i);
								out.println("<section>");
								out.println("<div class=\"content\">");
								out.println("<div class=\"inner\">");
								out.println("<header class=\"major\">");
								out.println("<h3 class=\"title\" id=\"" + i + "\">" + cDTO.getTitle() + "</h3>");
								out.println("</header><table>");
								out.println("<tr><td>첨부파일 : </td><td class=\"fn" + i + "\">" + cDTO.getFilename() + "</td></tr>");
								out.println("<tr><td>용량 : </td><td class=\"fs" + i + "\">" + cDTO.getFilesize() + "</td></tr>");
								out.println("<tr class=\"trrd\"><td>최종 수정일 : </td><td class=\"rd" + i + "\">" + cDTO.getReg_date()
										+ "</td></tr>");
								out.println(
										"<tr><td>업로드 날짜 : </td><td class=\"ud" + i + "\">" + cDTO.getUpload_date() + "</td></tr>");
								out.println("</table>");
					%>
					<div style="margin-bottom: 2em;">
						<%-- 						<input type="button" value="삭제" class="del" id="<%=i%>"> <input type="button" value="수정" class="upd" id="<%=i%>"> --%>
						<input type="button" value="다운로드" class="download" id="<%=i%>">
					</div>
					<%
						out.println("</div></div></section>");
							}
						} else {
							out.println(
									"<section><div style=\"text-align: center; margin: 0 auto;\" class=\"content\"><h3>업로드 된 파일이 없습니다</h3></div></section>");
						}
					%>
				</section>
				<div style="text-align: right; margin-right: 3em;">
					<a href="upload.ws" class="button primary">파일 업로드</a>
				</div>
			</form>

			<div style="text-align: center;">
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a id="pg${i}" class="page${i}" href="mycloud.ws?pageNum=${i}">[${i}]</a>
				</c:forEach>
			</div>
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