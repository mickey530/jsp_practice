<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
    
<%
	String inputId = request.getParameter("id");
	String inputPw = request.getParameter("pw");
	
	System.out.println(inputId);
	System.out.println(inputPw);
	
	// DB 연결을 위한 변수선언
	
	try{
		// 1. DB 종류 선택 및 연결
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "11111111";
		
		
		
		
		// 2. 쿼리문(사용자가 입력해준 fId 조회하기) 선언 및 PreparedStatement 객체 생성
		
		// 3. 쿼리문 실행 결과 ResultSet에 받기
		
		// 4. 사용자 입력 id를 기준으로 들어온 데이터가 있다면, (.equals로 검사 가능)
		//	  DB에 적재되어있었던 비밀번호를 마저 사용자 입력 비밀번호와 비교해 둘 다 일치하면 세션 발급
		//	  그렇지 않다면 로그인에 실패했습니다. 메세지가 뜨도록 처리
		
		// 5. 만약 웰컴페이지도 만들 여력이 되신다면
		//	  가입 이후 리다이렉트로 넘겨서
		//	  이름(아이디) 님 로그인을 환영합니다. 라는 문장이 뜨는 login_welcome.jsp 까지 구현해주세요.
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		
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