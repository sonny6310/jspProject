<%@page import="com.org.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	int x=0;
	if (id.equals("") || id.isEmpty() || id == null) {
		out.println(x);
	} else {
		MemberDAO mDAO = MemberDAO.getInstance();
		x = mDAO.idCheck(id);
		out.println(x);
	}
%>