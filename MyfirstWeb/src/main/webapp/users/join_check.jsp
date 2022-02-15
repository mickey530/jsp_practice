<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>    
    
<%
	request.setCharacterEncoding("utf-8");

	// 폼에서 날려준 데이터를 받아서 변수에 저장해주세요.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email"); 
	
	// 위의 사용자가 입력한 데이터를 토대로
	// 스크립트릿 내부에서 DB연동을 한 다음 INSERT 구문을 실행하도록 만들면 회원가입 절차 구현 가능
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root"; // mysql 아이디
	String dbPw = "11111111"; // mysql 비밀번호
	
	try{

	// 1. DB 종류 지정 및 연결
	Class.forName(dbType);
	Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
	// 2. 쿼리문 작성 및 pstmt 생성
	String sql = "INSERT INTO userinfo VALUES(?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	pstmt.setString(3, pw);
	pstmt.setString(4, email);
	
	// 3. pstmt 실행으로 사용자가 보낸 폼 데이터 DB에 저장
	pstmt.executeUpdate();
	
	
	con.close();
	pstmt.close();
	
	} catch(Exception e){
		e.printStackTrace();
	} finally{
	// 4. out.println("회원가입이 완료되었습니다."); 띄워서 가입 완료 알리기
	
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
					<h3><%= name %>(<%= id %>)님 회원가입이 완료되었습니다.</h3>
					<a href="login_form.jsp" class="btn btn-lg btn-primary">로그인 페이지로 이동</a>
				</body>
				</html>
<% } %>
			