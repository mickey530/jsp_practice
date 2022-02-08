<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 전송 시 한글 데이터 깨지지 않게 인코딩 설정 바꾸기
	request.setCharacterEncoding("utf-8");
	
	// form에서 보내준 데이터 받아오기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");
	
	String loginCheck = (String)session.getAttribute("session_id");
	if(loginCheck != null){
		response.sendRedirect("session_welcome.jsp");
	}
	
	if(id.equals("kkk1234") && pw.equals("1111")){
		session.setAttribute("session_id", id);
		session.setAttribute("session_pw", pw);
		session.setAttribute("session_nick", nick);
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
	<a href="session_login.jsp">로그인창으로 돌아가기</a>
</body>
</html>