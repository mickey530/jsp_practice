<%@page import="kr.co.ict.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	// DB연결 후, 세션에서 받아온 아이디를 이용해
	// 회원탈퇴 후 body에는 "아이디 회원의 탈퇴가 완료되었습니다."
	// 출력하고 실제로 DB에 DELETE 구문을 날려서 삭제까지 처리해주세요.
	// 로그인 안한 사용자가 접근시 login_form.jsp로 보내주세요.
	
	
	// 세션에서 아이디 받아오기
	String sessionId = (String)session.getAttribute("userId");

	if(sessionId == null){
		response.sendRedirect("login_form.jsp");
	}
	//================================================================//
	/* // DB 연결용 변수선언
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "11111111";
	
	try{
		
		// DB 종류 지정 및 연결
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// DELETE 구문
		String del = "DELETE FROM userinfo WHERE uid = ?";
		
		// PSTMT 생성 및 세팅
		PreparedStatement pstmt = con.prepareStatement(del);
		pstmt.setString(1, sessionId);
		
		// 쿼리문 실행
		pstmt.executeUpdate();
		
		
		// 자원 회수 (없어도 로직이 돌아가긴 하지만 해주는 것 권장)
		con.close();
		pstmt.close();
			
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		// 세션까지 삭제하기
		session.invalidate();	
	} */
	//================================================================//
	
	UserDAO dao = UserDAO.getInstance();
	dao.deleteUser(sessionId);
	
	// 처음에 이거 빠트려서 db에서는 삭제되었지만 세션에 남아있어서 
	// 페이지들이 안뜨는 오류가 발생했음. 일단 JSESSOIONID 쿠키를 삭제해서 세션연결 끊음.
	session.invalidate(); 
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= sessionId %> 회원의 탈퇴가 완료되었습니다.<br/>
	<a href="login_form.jsp">로그인 페이지로 돌아가기</a>
</body>
</html>