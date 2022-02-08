<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	/* 
		application은 application 객체를 사용해서 저장하거나
		데이터 값을 받아올 수 있습니다.
		
		getAttribute() 메서드와 setAttribute() 메서드를 사용할 수 있고
		
		application에 한 번 저장된 객체는
		서버 종료 전까지 계속 유지됩니다.
	*/
	
	int visitCnt = 0;
	
	Integer temp = (Integer)application.getAttribute("visit");
	if(temp != null){
		visitCnt = temp;
	}
	visitCnt++;
	
	application.setAttribute("visit", visitCnt);
%>

<hr/>
	<h3>방문자수 : <%= visitCnt %></h3>
<hr/>