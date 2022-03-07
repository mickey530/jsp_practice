<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 서블릿으로 보내기 위해서는 action에 서블릿 접속주소를 복붙합니다. http 포함 -->
	<form action="http://localhost:8181/MyfirstWeb/calmdown" method="post">
		<input type="text" name="jsp" placeholder="jsp에 들어갈 내용"><br/>
		<input type="text" name="boot" placeholder="boot에 들어갈 내용"><br/>
		<input type="text" name="jpa" placeholder="jpa에 들어갈 내용"><br/>
		<input type="submit" value="제출">
	</form>

</body>
</html>