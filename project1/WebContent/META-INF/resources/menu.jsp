<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav id="menu">
	<ul class="links">
		<li><a href="index.ws">홈</a></li>
		<li><a href="upload.ws">파일 업로드</a></li>
		<li><a href="mycloud.ws">내 클라우드</a></li>
		<!-- 				<li><a href="generic.ws">Generic</a></li> -->
		<!-- 				<li><a href="elements.ws">Elements</a></li> -->
	</ul>
	<ul class="actions stacked">
		<%
			if (session.getAttribute("signedUser") == null) {
		%>
		<li><a href="login.ws" class="button fit">로그인</a></li>
		<li><a href="signup.ws" class="button fit">회원가입</a></li>
		<%
			} else {
		%>
		<li><a href="logout.ws" class="button fit">로그아웃</a></li>
		<%
			}
		%>
	</ul>
</nav>