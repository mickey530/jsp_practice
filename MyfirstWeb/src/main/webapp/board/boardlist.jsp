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
<style>
	a{text-decoration:none; color:black;}
	thead, tbody{text-align: center;}
	.title {text-align: left;}
</style>
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
      <th scope="col"">게시일</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach var="i" items="${boardList }">
			<tr>
				<td>${i.board_num}</td>
				<td class="title"><a href="http://localhost:8181/MyfirstWeb/boardDetail.do?board_num=${i.board_num}">${i.title}</a></td>
				<td>${i.writer}</td>
				<td>${i.bdate}</td>
				<td>${i.hit}</td>
	    	</tr>
	</c:forEach>
  </tbody>
</table>




<c:if test="${sId ne null }">
<form action="http://localhost:8181/MyfirstWeb/insertForm.do" method="get">
	<input type="submit" value="게시글 작성" class="btn btn-light">
</form>
</c:if>

<%-- 	
	0번째 요소 : ${boardList[0] }<br/>
	1번째 요소 : ${boardList[1] }<br/>
	2번째 요소 : ${boardList[2] }<br/>
	<hr/>
	글 번호 : ${boardList[0].board_num }<br/>
	글 제목 : ${boardList[0].title } --%>
	
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item ${dto.currentPage eq 1 ? 'disabled' : '' }">
    	<a class="page-link" href="http://localhost:8181/MyfirstWeb/boardList.do?pageNum=${dto.currentPage - 1 }" aria-label="Previous">
    		<span aria-hidden="true">&laquo;</span>
		</a>      
    </li>
    <c:forEach var="pageIndex" begin="${dto.startPage }" end="${dto.endPage }" >
        <li class="page-item ${dto.currentPage eq pageIndex ? 'active' : '' }"><a class="page-link" href="http://localhost:8181/MyfirstWeb/boardList.do?pageNum=${pageIndex}">${pageIndex}</a></li>
    </c:forEach>
    <li class="page-item ${dto.currentPage eq dto.totalPages ? 'disabled' : '' }">
      <a class="page-link" href="http://localhost:8181/MyfirstWeb/boardList.do?pageNum=${dto.currentPage + 1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
	<hr/>
	<h3>노 부트스트랩</h3>
	<c:if test="${dto.startPage ne 1 }">
    <a href="http://localhost:8181/MyfirstWeb/boardList.do?pageNum=${dto.startPage - 1 }">&lt;</a>      
	</c:if>
	
    <c:forEach var="pageIndex" begin="${dto.startPage }" end="${dto.endPage }" >
    	<c:if test="${dto.currentPage eq pageIndex }">
    		<a style="font-weight:bold" href="http://localhost:8181/MyfirstWeb/boardList.do?pageNum=${pageIndex}">[${pageIndex }]</a>
    	</c:if>
    	<c:if test="${dto.currentPage ne pageIndex }">
			<a href="http://localhost:8181/MyfirstWeb/boardList.do?pageNum=${pageIndex}">[${pageIndex }]</a>
    	</c:if>
	</c:forEach>
	
	<c:if test="${dto.endPage ne dto.totalPages }">
		<a href="http://localhost:8181/MyfirstWeb/boardList.do?pageNum=${dto.endPage + 1 }">&gt;</a>	
	</c:if>
	<br/>		
	${dto}
</body>
</html>