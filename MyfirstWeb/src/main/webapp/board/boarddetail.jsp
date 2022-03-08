<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	html, body{height:100%}
	.modal-dialog{}
</style>
<title>Insert title here</title>
</head>
<body>
<%-- <div class="modal modal-sheet position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSheet">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-6 shadow">
      <div class="modal-header border-bottom-0">
        <h5 class="modal-title">제목 : ${boardData.title}</h5>
        <h6 class="modal-title">저자 : ${boardData.writer}</h6>
      </div>
      <div class="modal-body py-0">
        <p>${boardData.content}</p>
      </div>

    </div>
  </div>
</div> --%>

제목 : <input type="text" value="${boardData.title}" readonly>
작성자 : <input type="text" value="${boardData.writer}" readonly>
조회수 : ${boardData.hit }<br/>
작성일 : <Input type="text" value="${boardData.bdate}" readonly>
수정일 : ${boardData.mdate}<br/>
<textarea rows="15" cols="50">${boardData.content}</textarea><br/>
<a href="http://localhost:8181/MyfirstWeb/BoardList">목록으로</a>
</body>
</html>