<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
    
<%
	 // form 데이터 변수에 저장
	request.setCharacterEncoding("utf-8");
	String inputId = request.getParameter("id");
	String inputPw = request.getParameter("pw");
	
	// ========================================================== //
/*	try{
		// DB 연결을 위한 변수선언
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "11111111";
		
		// 1. DB 종류 선택 및 연결
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 2. 쿼리문(사용자가 입력해준 inputId 조회하기) 선언 및 PreparedStatement 객체 생성
		String sql = "SELECT * FROM userinfo WHERE uid = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, inputId);
		
		// 3. 쿼리문 실행 결과 ResultSet에 받기
		ResultSet rs = pstmt.executeQuery(); */
		
		
		
		
		// 4. 사용자 입력 id를 기준으로 들어온 데이터가 있다면(rs.next()), 
		//	  DB에 적재되어있었던 비밀번호를 마저 비교해(.equals로 검사 가능)
		//	  사용자 입력 비밀번호와 일치하면 세션 발급.
		//	  그렇지 않다면 로그인에 실패했습니다. 메세지가 뜨도록 처리
		
		/* if(rs.next()){
			if(inputPw.equals(rs.getString("upw"))){
				// 세션 발급 및 로그인 페이지로 이동 (아이디랑 이름을 발급받는게 좋음.)
				// 수정/탈퇴의 경우 비밀번호를 한 번 더 입력하게 되는데 이때에는
				// 세션에 저장해두는 편이 DB에서 가져오는 것 보다 훨씬 효율적임
				session.setAttribute("userId", inputId);
				response.sendRedirect("login_welcome.jsp");				
			} else{
				// 로그인 실패 메세지
				out.println("로그인에 실패했습니다.<br/>" +
				"<a href='login_form.jsp'>로그인 페이지로 돌아가기</a><br/>");
			};
		}
		// 닫아주기(페이지 넘어가면 자동으로 종료되는건가?)
		con.close();
		pstmt.close();
		
		// 5. 만약 웰컴페이지도 만들 여력이 되신다면
		//	  가입 이후 리다이렉트로 넘겨서
		//	  이름(아이디) 님 로그인을 환영합니다. 라는 문장이 뜨는 login_welcome.jsp 까지 구현해주세요.
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		
	} */
	

	// ========================================================== //
	// 이거 있으면 login_form에서 넘어올때 에러남
	/* // 세션에 이미 로그인 정보가 있는지 확인
	String sessionId = (String)session.getAttribute("userId");
	
	// 로그인 정보가 있다면 login_welcome.jsp 페이지로 리다이렉트
	if(sessionId != null){
		response.sendRedirect("login_welcome.jsp");
	} 
	// 로그인 정보가 없다면 login_form.jsp로 리다이렉트
	else {
		response.sendRedirect("login_form.jsp");
	} */
	// ========================================================== //
	
	
		UserDAO dao = UserDAO.getInstance();
		UserVO userInfo = dao.getUserData(inputId);
		// 이미 아이디로 가져온 데이터 이기 때문에 비밀번호만 비교하지만
		// 만약 없는 아이디를 요청한 경우 NUll이 발생.
		// .equals()는 String 자료형만 비교하기 때문에
		// 오류가 발생. if문으로 null 한번 더 걸러줘야함
		if(userInfo != null){
			if(inputPw.equals(userInfo.getuPw())){
				session.setAttribute("userId", inputId);
				response.sendRedirect("login_welcome.jsp");
			}
		} else{
			// 로그인 실패 메세지
			out.println("로그인에 실패했습니다.<br/>" +
			"<a href='login_form.jsp'>로그인 페이지로 돌아가기</a><br/>");
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