<%@page import="kr.co.ict.UserDAO"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아까 발생했던 rs.close() 실행 문제로 인해
	// DB에 있는 자료를 꺼냈을 때, 곧바로 jsva 데이터로 받아오는 작업을 수행한 다음
	// rs.close()를 하면 문제가 없습니다.
	// 따라서 SELECT 구문의 결과 (SQL데이터)를 자바 형식으로 담을 클래스가 필요하고
	// 이를 VO(Value Object)라고 부릅니다.
	// VO는 클래스이기 때문에 src/main/java에 클래스를 선언 및 정의합니다.
	// UserVO.class를 만들어보겠습니다.
	
	// =================================================================//
/* 	// 1. DB접속 변수 생성
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root"; // mysql 아이디
	String dbPw = "11111111"; // mysql 비밀번호
	
	ResultSet rs = null; 
	Connection con = null;
	PreparedStatement pstmt = null;

	// ArrayList<UserVO> 자료형을 이용해 한 줄 한 줄 단위로 여러 row를 저장합니다.
	List<UserVO> userList = new ArrayList<>();
	// 2. 연결
		try{
			Class.forName(dbType);
			con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
		// 3 SELECT * FROM userinfo 실행 및 ResultSet에 저장
		String getInfo = "SELECT * FROM userinfo";
		pstmt = con.prepareStatement(getInfo);
		rs = pstmt.executeQuery();
		
		//
		
 		while(rs.next()){
			// 1. ResultSet에서 데이터 가져오기
			String uName = rs.getString("uname");
			String uId = rs.getString("uid");
			String uPw = rs.getString("upw");
			String uEmail = rs.getString("uemail");
			
			// 클래스 이름이 같더라도 오버라이딩 되기 때문에 구분 가능
			UserVO userData = new UserVO(uName, uId, uPw, uEmail);
			userList.add(userData);
		}
		// System.out.println(userList);
		// out.println(userList + "<br/>");
			
			
		} catch(Exception e){
			e.printStackTrace();		
		} finally{
			con.close();
			pstmt.close();
			rs.close();
		} */
	// =================================================================//
	
	// 모든 접속정보는 UserDAO 클래스 내에 있습니다.
	// 따라서 UserDAO를 생성하는 것으로 접속정보 설정이 끝납니다.
	// UserDAO 생성
	UserDAO dao = UserDAO.getInstance();
	
	// dao 내부에 userinfo 테이블 전체의 데이터를 가져오는
	// getAllUserList()를 호출하는 것으로 필요 데이터 적재가 끝납니다.
	
	// UserDAO의 리턴자료(userList)를
	// List<UserVO> 자료형 변수(userList)에 대입
	List<UserVO> userList = dao.getAllUserList();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 미디어 쿼리 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="text-center" style="margin:20px;">
	<!-- 향상된 for문을 이용해서 userList 내부의 데이터를
	Table의 형태로 user_list1 과 동일한 양식으로 화면에 출력해주세요. -->
		<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th scope="col">이름</th>
				<th scope="col">아이디</th>
				<th scope="col">비밀번호</th>
				<th scope="col">이메일</th>
			</tr>
		</thead>
		<tbody>
		<% for(UserVO s : userList){ %>
			<tr>
				<td><%= s.getuName() %></td>
				<td><%= s.getuId() %></td>
				<td><%= s.getuPw() %></td>
				<td><%= s.getuEmail() %></td>
			</tr>
			
		<% } %>
		</tbody>
		</table>
</body>
</html>