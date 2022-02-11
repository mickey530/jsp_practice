<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>로그인</title>
</head>
<body>
	<!-- 아이디와 비밀번호를 적어넣을 수 있는 폼을 만들어주세요.
	목적지는 login_check.jsp 입니다. -->
	<header>
		<h2>로그인 페이지</h2>
	</header>
	<div class="contanier">
		<form action="login_check.jsp" method="post">
			<input type="text" name="id" placeholder="아이디"><br/>
			<input type="password" name="pw" placeholder="비밀번호"><br/>
			<a href="join_form.jsp" class="btn btn-outline-primary">회원가입</a>
			<input type="submit" value="로그인" class="btn btn-primary">
		</form>
	</div>
	
</body>
</html>