<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	// Declaration 내부에
	// 1 ~ 10 범위의 난수를 리턴하는 메서드
	// int randomNumber() 를 선언해주세요.
	int randomNumber(){
		// 정수 1 ~ 10 까지 발생시켜서 리턴하도록 로직 작성
		return (int)(Math.random()*10 + 1);
}
	String randomColor(){
		String result;
		int i = (int)(Math.random()*3);
		if(i == 0){
			result = "red";
		} else if(i == 1){
			result = "blue";
		} else{
			result = "green";
		}
		return result;
	}

	// declaration에 선언한 변수는 서버를 끄기 전까지는 값이 누적됩니다.
	// 일종의 static처럼 작동합니다.
	public int total = 0;
%>

<%
	String todayColor = randomColor();
%>
<h1>Web프로그래밍</h1>

<h2>오늘의 행운의 숫자와 행운의 색깔</h2>
<p>행운의 숫자 : <b><%= randomNumber() %></b></p>
<p>행운의 색깔 : <b style="color:<%= todayColor %>"><%= todayColor %></b></p>
<h3>오늘의 방문자수</h3>
<%
	out.println(++total);
	// scriptlet 내부에 선언한 변수는 접속시마다 초기화됩니다.
	int currentNum = 0;
	out.println("<br/>");
	out.println(++currentNum);
%>
</body>
</html>