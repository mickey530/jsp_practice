<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>

<form action="http://localhost:8181/MyfirstWeb/boardUpdate" method="post">
	제목 : <input type="text" name="title" value="${boardData.title}">
	작성자 : <input type="text" value="${boardData.writer}" readonly><br/>
	작성일 : ${boardData.bdate} |
	수정일 : ${boardData.mdate} |
	조회수 : ${boardData.hit }<br/>

	<textarea rows="15" cols="50" name="content">${boardData.content}</textarea><br/>
	<input type="hidden" name="board_num" value="${boardData.board_num}">
	<input type="submit" value="수정완료">
</form>
</body>
</html>