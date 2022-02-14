<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 이미 로그인 정보가 있는지 확인
	String sessionId = (String)session.getAttribute("userId");
	
	// login_welcome.jsp 페이지로 리다이렉트
	if(sessionId != null){
		response.sendRedirect("login_welcome.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
	.form-signin input[type="text"] {
    margin-bottom: -1px;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
	}
	.form-signin input[type="password"] {
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
	}
	.form-floating{height: 57px;}
	
	.form-check{text-align:left; margin:16px;}
	.btn{font-size:1.25rem; margin-bottom: 10px;}
</style>
<title>로그인</title>
</head>
<body class="text-center">
	<!-- 아이디와 비밀번호를 적어넣을 수 있는 폼을 만들어주세요.
	목적지는 login_check.jsp 입니다. -->	
	<main class="form-signin">
		<image src="https://www.hermes.com/sites/all/themes/custom/hermes/img/hermes-logo.svg" class="h3 mb-3 fw-normal" width="50%">
		<form action="login_check.jsp" method="post">
			<div class="form-floating" >
				<input type="text" name="id" placeholder="아이디" class="form-control" id="floatingInput" >
				<label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" name="pw" placeholder="비밀번호" class="form-control" id="floatingPassword"><br/>
				<label for="floatingPassword">비밀번호</label>					
			</div>
			
   			<div class="form-check">
			  <input class="form-check-input" type="checkbox" name="remember" value="checked" id="flexCheckDefault">
			  <label class="form-check-label" for="flexCheckDefault">
			    자동 로그인
			  </label>
			</div>
   			
   			
   			
   			<div class="form-check">
			  <input class="form-check-input" type="checkbox" name="remember" value="checked" id="flexCheckDefault">
			  <label class="form-check-label" for="flexCheckDefault">
			    자동 로그인
			  </label>
			</div>
   			
   			
   			
   			
						
			<input type="submit" value="로그인" class="w-100 btn btn-lg btn-primary"><br/>
			<a href="join_form.jsp" class="w-100 btn btn-outline-secondary">회원가입</a>
		</form>	
	</main>
</body>
</html>