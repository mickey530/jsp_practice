<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/MyfirstWeb/insertBoard.do"" method="post">
		<!-- fool-proof, idiot-proof -->
		<input type="text" name="title" placeholder="제목" required><br/>
		<input type="text" name="writer" placeholder="저자" required><br/>
		<textarea name="content" placeholder="내용을 입력해주세요" cols="60" rows="30" required></textarea><br/>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>