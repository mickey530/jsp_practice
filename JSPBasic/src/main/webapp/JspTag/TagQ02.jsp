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
public int today = 0;

int randomNum(){
	return (int)(Math.random()*8 + 2);
}

%>
<h1>랜덤 구구단</h1>

<% int dan = randomNum(); %>

<p>이번에 나온 구구단은 <%= dan %> 입니다.</p>  

<%
for(int i = 1; i < 10; i++){
	out.println(dan + " * " + i + " = " + dan * i + "<br/>");
}

%>
</body>
</html>