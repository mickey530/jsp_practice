<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginId = "ict_03";
	String loginPw = "1234";
%>
<%
	String inputId = request.getParameter("id");
	String inputPw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(inputId.equals(loginId) && inputPw.equals(loginPw)){ %>
		<h1><%= loginId %>님 환영합니다!</h1>
	<% } else{ %>
		<p>로그인에 실패했습니다.</p>
		<form action="req_login_result.jsp" method="post">
		<input type="text" name="id" placeholder="아이디"><br/>
		<input type="password" name="pw" placeholder="비밀번호">
		<input type="submit" value="로그인">
		</form>
		<!-- 회원가입으로 넘어가는 로직 추가! -->
		
		<a href="#">아이디 찾기</a>
		<a href="#">비밀번호 찾기</a>
	<% } %>
</body>
</html>