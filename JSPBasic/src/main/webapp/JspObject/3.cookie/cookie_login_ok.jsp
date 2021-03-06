<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼에서 날아온 데이터들을 저장해주세요.
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	String checked = request.getParameter("auto_login");
	
	// 만약 자동로그인이 설정이 되어있다면 쿠키를 생성해주시고
	// cookie name값은 "auto_login" value값은 전달받은 아이디로 해 주세요.
	// 쿠키 유효시간은 50초입니다.
	Cookie autoLogin = new Cookie("auto_login", id); // if문 안쪽에 넣어주는게 리소스를 더 적게 사용할 듯.
	autoLogin.setMaxAge(50);
	
	// 쿠키가 생성되었건 말건 cookie_welcome.jsp로 리다이렉트 시켜줍니다.
	// 만약 로그인에 실패했다면 body 태그내에
	// "로그인이 실패했습니다." 라는 문구와 함께
	// a태그를 이용해 로그인 화면으로 돌아가는 로직을 대신 볼 수 있도록 처리해주세요.
	// 아이디는 abc1234이고, 비밀번호는 "aaa1111"인 경우 로그인을 허용합니다.
	
	
	if(id.equals("abc1234") && pw.equals("aaa1111")){
		if(checked != null){ // 체크를 안했을경우 null이 발생. 여기서 만약 equals를 사용해서 비교했다면 null은 자료형이 다르기 때문에 에러 발생.
			response.addCookie(autoLogin);
		}
		response.sendRedirect("cookie_welcome.jsp");
	} else{
		out.println("<a href='cookie_login.jsp'>로그인에 실패했습니다.</a>");
		// 그냥 아래 html에 작성해도 되지만 어차피 if문에서 성공시 페이지가 리다이렉션 되기 때문에
		// 그냥 아래에 작성해도 무방
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>