<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// 스크립트릿을 활용한 로그인 확인
	String sId = (String)session.getAttribute("userId");
	// 로그인 안 된 사용자의 sId 체크
	System.out.println(sId);
%>
<c:set var="sId"><%= sId %></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>안녕하세요 메인페이지입니다</h1>
	<h2>web.xml 내부 welcomepage 설정에 index.jsp라고 적혀있어서</h2>
	<h2>이 페이지가 메인 페이지로 자동 설정됩니다.</h2>
	<h2>여러분이 welcomepage 설정을 고쳐서 index.jsp가 아닌</h2>
	<h2>다른 임의의 명칭을 메인페이지로 만들어 줄 수도 있습니다.</h2>
	
	<a href="http://localhost:8181/MyfirstWeb/boardList.do">게시판 드가자~</a>
	<c:if test="${sessionScope.userId eq null }">
		<a href="http://localhost:8181/MyfirstWeb/users/login_form.jsp">로그인</a>
		<a href="http://localhost:8181/MyfirstWeb/users/join_form.jsp">회원가입</a>
	</c:if>
	<c:if test="${sessionScope.userId ne null }">
		<a href="http://localhost:8181/MyfirstWeb/users/logout.jsp">로그아웃</a>
	</c:if>
	
</body>
</html>