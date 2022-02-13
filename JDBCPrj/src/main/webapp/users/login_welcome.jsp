<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
    
<%

%>
<%
	/* 세션에 저장되어있는 아이디 가져오기 */
	String sessionId = (String)session.getAttribute("userId");
	
	// 세션에 저장된 아이디가 존재한다면 DB조회를 위한 if문 실행
	if(sessionId != null){
		
		try{			
			// DB 연결을 위한 변수선언
			String dbType = "com.mysql.cj.jdbc.Driver";
			String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
			String dbId = "root";
			String dbPw = "11111111";

			// DB 종류 선택 및 연결
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// 쿼리문 작성
			String sql = "SELECT * FROM userinfo WHERE uid = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 세션 아이디 정보 DB에서 가져오기
			pstmt.setString(1, sessionId);
			
			// Resultset으로 가져온 정보 저장
			ResultSet rs = pstmt.executeQuery();
			
			// 가져온 정보에서 -1 인덱스로 가져온다는 뜻인듯 그래서 .next() 해줘야함
			rs.next();
			
			// ResultSet에서 이름 가져오기
			String userName = rs.getString("uname");
			
			// 이름(아이디)님 로그인을 환영합니다.

			%>
				<!DOCTYPE html>
				<html>
				<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<!-- 부트스트랩 링크 -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
				<style>
					html, body {
					    height: 100%;
					}
					body {
					    display: flex;
					    align-items: center;
					    justify-content: center;
					    flex-direction: column;
					    padding-top: 40px;
					    padding-bottom: 40px;
					    background-color: #f5f5f5;
					}
				</style>
				</head>
				<body class="text-center">
					<h3><%= userName %>(<%= sessionId %>)님 로그인을 환영합니다.</h3>
					<a href="login_logout.jsp" class="btn btn-outline-danger">로그아웃</a>
				</body>
				</html>
			<%
			
			// 실행중인거 닫아주기
			con.close();
			pstmt.close();
			
			} catch(Exception e){
				e.printStackTrace();
			} finally{
				
			}
		
		} 
	// 세션에 아이디가 존재하지 않는다면 login_form.jsp 로 리다이렉트
	else{
		response.sendRedirect("login_form.jsp");
	}
%>