<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 전부 파기
	session.invalidate();

	// 로그인 창으로 리다이렉트
	response.sendRedirect("login_form.jsp");
%>