<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 테스트</title>

</head>
<body>
	<h1>회원 가입 양식</h1>
	<form action="#" method="get"> <!-- get 방식 (url에 노출이 되어 보안x)-->
		<input type="text" name="id" placeholder="아이디" /><br/>
		<input type="passwoprd" name="pw" placeholder="비밀번호" /><br/>
		<input type="submit" value="제출"/><br/>
	</form>
	
		<form action="#" method="post"> <!-- post 방식 (url에 노출되지 않아 보안o) -->
		<input type="text" name="id" placeholder="아이디" /><br/>
		<input type="passwoprd" name="pw" placeholder="비밀번호" /><br/>
		<input type="submit" value="제출"/><br/>
	</form>
</body>
</html>