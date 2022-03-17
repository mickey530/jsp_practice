<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sId eq null }">
	<% response.sendRedirect("http://localhost:8181/MyfirstWeb/boardList.do"); %>
</c:if>
   
<!DOCTYPE html>
<html>
<head>
	<c:if test="${sessionScope.userId eq null}">
		<script>
			location.href="http://localhost:8181/MyfirstWeb/boardList.do";
		</script>
	</c:if>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/MyfirstWeb/BoardInsert.do" method="post">
		<!-- fool-proof, idiot-proof -->
		<input type="text" name="title" placeholder="제목" required>
		<input type="text" name="writer" value="${sId}" readonly><br/>
		<textarea name="content" placeholder="내용을 입력해주세요" cols="60" rows="30" required></textarea><br/>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>