<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// auto login 관형해서 발급된 쿠키가 있는지 체크해서 쿠키가 있다면
	// 로그인 창을 보여주는 대신 바로 welcome 페이지로 보내주세요. (cookie_check.jsp 참조)
	Cookie[] cookies = request.getCookies();

	String autoLogin = null;
	String userId = null;
	
	// cookies가 null이 아닌 경우만 체크하도록 if문
	if(cookies != null){
		for(Cookie s : cookies){	
			autoLogin = s.getName();
			// null값이 들어왔을 때 바로 equals를 사용하면 500에러 발생하기 때문에 위에서 null 검사 진행
			if(autoLogin.equals("auto_login")){
					// cookie_welcome 페이지로 리다이렉트
					response.sendRedirect("cookie_welcome.jsp");
			}
		}
	}
	
	// JSESSIONID 쿠키는 어떤 브라우저에서 접속한건지 확인하기 위한 인증서
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인창은 form으로 구성해주시면 됩니다.
input text 1개(유저 아이디 입력), input password 1개(비밀번호 입력),
input checkbox 1개(자동로그인)
목적지는 cookie_login_ok.jsp 로 해주세요. -->

<form action="cookie_login_ok.jsp" method="post">
	아이디 : <input type="text" name="userId"><br/>
	비밀번호 : <input type="password" name="userPw"><br/>
	자동 로그인 <input type="checkbox" name="auto_login" value="checked">
	<input type="submit" value="로그인">
	<input type="reset" value="초기화">
</form>

</body>
</html>