<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    

<%
	// 상위지역에서 미리 변수를 선언 및 초기화 해놔야
	// 표현식에서 저장된 값을 활용할 수 있다.
	String uname = null;
	String uemail = null;

	// 세션에서 아이디 가져오기
	String sessionId = (String)session.getAttribute("userId");
	
	// 로그인 되어있지 않다면 login_form.jsp로 리다이렉트
	if(sessionId == null){
		response.sendRedirect("login_form.jsp");
	}

	try {
		// DB 연결을 위한 변수선언
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "11111111";
		
		// DB 종류 선택 및 연결
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// DB에 유저 정보 요청하기
		String userinfo = "SELECT * FROM userinfo WHERE uid = ?";
		PreparedStatement pstmt = con.prepareStatement(userinfo);
		pstmt.setString(1, sessionId);
		
		// DB에서 가져온 유저 정보 ResultSet에 저장 (rs.next() 까먹지 말자)
		// 혹시나 데이터가 안들어왔ㅇ을 상황에 대비해서 if문의 조건절에 넣어서
		// 실행하는 것이 좋음
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		// 이름, 이메일 변수에 저장
		uname = rs.getString("uname");
		uemail = rs.getString("uemail");
		
	// 실행중인거 닫아주기
	con.close();
	pstmt.close();
	
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 미디어 쿼리 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		<h5><%= sessionId %></h5><h6>님의 개인정보를 수정합니다.</h6>
		
		<form action="update_check.jsp" method="post">

			<div class="form-floating">
				<input type="password" name="pw" placeholder="비밀번호" class="form-control" id="floatingInput"  required><br/>
				<label for="floatingInput">비밀번호</label>
			</div>
			<div class="form-floating">
				<input type="text" name="name" placeholder="이름" class="form-control" id="floatingInput" value="<%= uname %>" required><br/>
				<label for="floatingInput">이름</label>
			</div>
			<div class="form-floating">
				<input type="text" name="email" placeholder="이메일" class="form-control" id="floatingInput" value="<%= uemail %>" ><br/>
				<label for="floatingInput">이메일</label>
			</div>
		
			<input type="submit" value="수정완료" class="w-100 btn btn-lg btn-success">
		</form>
	</main>		
</body>
</html>

