<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 부트스트랩 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<!-- 폼을 만들어주세요. 폼의 목적지는 join_check.jsp 입니다.
	userinfo 테이블에 작성된 대로 아이디, 비밀번호, 이름, 이메일을 가입요소로 받습니다.
	name속성까지 맞춰주시고, submit버튼까지 함께 작성해주세요. -->
	
	<header>
		<h1>회원가입</h1>
	</header>
	<div class="container">
		<form action="join_check.jsp" method="post">
			<input type="text" name="id" placeholder="아이디" required><br/>
			<input type="password" name="pw" placeholder="비밀번호" required><br/>
			<input type="text" name="name" placeholder="이름" required><br/>
			<input type="text" name="email" placeholder="이메일"><br/>
			<input type="submit" value="가입하기">
		</form>
	</div>
</body>
</html>