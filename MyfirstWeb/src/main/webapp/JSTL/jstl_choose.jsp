<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c태그라이브러리 사용할 수 있도록 지시자(디렉티브)를 작성해주세요. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jstl_form2.jsp 를 만들어서 목적지를 여기로 하고
	실제로 보낸 데이터가 여기서 출력되도록 만들어주세요. -->
<c:choose>
	<c:when test="${param.name eq '이병건'}">
		이병이병건
	</c:when>	
	<c:when test="${param.name eq '주호민'}">
		무신사 섹시백
	</c:when>	
	<c:otherwise>
		당신은 한국인이 아닙니다.
	</c:otherwise>
</c:choose>
	
</body>
</html>