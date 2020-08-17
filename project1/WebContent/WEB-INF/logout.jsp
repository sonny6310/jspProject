<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	if (<%=session.getAttribute("signedUser") == null%>) {
		alert("로그인 되어있지 않습니다");
		window.location = "login.ws";
	} else {
		<%
			session.invalidate();
		%>
		alert("로그아웃 완료");
		window.location = "index.ws";
	}
</script>