<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 부트스트랩 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	html, body {
	    height: 100%;
	}
	body {
   	 	display: flex;
   		align-items: center;
   		padding-top: 40px;
   		padding-bottom: 40px;	
   		background-color: #f5f5f5;
	}
	.form-signin {
	    width: 100%;
	    max-width: 330px;
	    padding: 15px;
	    margin: auto;
	}
	
	.form-signin input {
   		margin-bottom: 10px;
	}
	.form-floating{height: 70px;}
	.btn{font-size:1.25rem; margin-bottom: 10px;}
</style>
</head>
<body class="text-center">
	<!-- 폼을 만들어주세요. 폼의 목적지는 join_check.jsp 입니다.
	userinfo 테이블에 작성된 대로 아이디, 비밀번호, 이름, 이메일을 가입요소로 받습니다.
	name속성까지 맞춰주시고, submit버튼까지 함께 작성해주세요. -->
	<main class="form-signin">
		<image src="https://www.hermes.com/sites/all/themes/custom/hermes/img/hermes-logo.svg" class="h3 mb-3 fw-normal" width="50%">
		<form action="join_check.jsp" method="post">
			<div class="form-floating">
				<input type="text" name="id" placeholder="아이디" class="form-control" id="floatingInput" required><br/>
				<label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" name="pw" placeholder="비밀번호" class="form-control" id="floatingInput" required><br/>
				<label for="floatingInput">비밀번호</label>
			</div>
			<div class="form-floating">
				<input type="text" name="name" placeholder="이름" class="form-control" id="floatingInput" required><br/>
				<label for="floatingInput">이름</label>
			</div>
			<div class="form-floating">
				<input type="text" name="email" placeholder="이메일" class="form-control" id="floatingInput"><br/>
				<label for="floatingInput">이메일</label>
			</div>
		
			<input type="submit" value="가입하기" class="w-100 btn btn-lg btn-primary">
		</form>
	</main>
		
</body>
</html>