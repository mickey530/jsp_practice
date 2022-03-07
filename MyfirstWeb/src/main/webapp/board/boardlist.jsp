<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<!-- 출력방법 : 인덱싱이나 c:forEach를 이용해서 하나하나 꺼내준 다음
	.변수명을 적을면 출력됩니다. -->
	
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">제목</th>
      <th scope="col">저자</th>
      <th scope="col">게시일</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach var="i" items="${boardList }">
		<tr>
			<td>${i.board_num}</td>
			<td>${i.title}</td>
			<td>${i.writer}</td>
			<td>${i.bdate}</td>
			<td>${i.hit}</td>
	    </tr>
	</c:forEach>
  </tbody>
</table>

	
	0번째 요소 : ${boardList[0] }<br/>
	1번째 요소 : ${boardList[1] }<br/>
	2번째 요소 : ${boardList[2] }<br/>
	<hr/>
	글 번호 : ${boardList[0].board_num }<br/>
	글 제목 : ${boardList[0].title }
</body>
</html>