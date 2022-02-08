<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("session_id");
	if(id != null){
		response.sendRedirect("session_welcome.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="session_login_check.jsp" method="post">
			<input type="text" name="id" placeholder="아이디" required><br/>
			<input type="password" name="pw" placeholder="비밀번호" required><br/>
			<input type="text" name="nick" placeholder="닉네임" required>
			<input type="submit" value="로그인">
	</form>
</body>
</html>