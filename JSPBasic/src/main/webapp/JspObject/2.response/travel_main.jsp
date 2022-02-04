<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		form 태그를 만들어주시고 목적지는 travel_check.jsp, post방식입니다
		라디오 버튼을 최소 4개 만들어주세요.
		각 라디오 버튼에는 속성으로 value= 라고 설정하여 무엇을 선택했는지 식별할 수 있도록
		각 버튼별로 다른 value값을 지정해주세요.
		
		submit 버튼도하나 만들어주세요.
	 -->
	 <form action="travel_check.jsp" method="post">
	 	부산<input type="radio" name="city" value="busan">
	 	도쿄<input type="radio" name="city" value="tokyo">
	 	상해<input type="radio" name="city" value="shanghi">
	 	뉴욕<input type="radio" name="city" value="newyork">
		<input type="submit" value="여행가기">
	 </form>
</body>
</html>