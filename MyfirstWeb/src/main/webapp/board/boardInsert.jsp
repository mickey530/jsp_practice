<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/MyfirstWeb/insertBoard" method="post">
		<input type="text" name="title" placeholder="제목"><br/>
		<textarea name="content" placeholder="내용을 입력해주세요"></textarea><br/>
		<input type="text" name="writer" placeholder="저자"><br/>
		<input type="submit" value="등록">
	</form>
</body>
</html>