<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 표현식의 경우 없는 변수 사용시 오류가 발생해 페이지 출력이 안되지만
	el의 경우 0으로 처리하는 등으로 오류가 발생하지 않음 -->

	${10}<br/>
	${3.14}<br/>
	${"hello"}<br/>
	${true}<br/>
	${a + 20}<br/>
	<hr/>
	${a }<br/>
	${a < 10 }<br/>
	${(a == 15) ? "a는 15와 같다" : "a는 15와 다르다"}<br/>
	${(a > 10) || (a != 15) }<br/>
	
</body>
</html>