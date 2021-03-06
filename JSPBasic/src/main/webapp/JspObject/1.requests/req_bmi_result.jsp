<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	double height = Double.parseDouble(request.getParameter("height"));
	int weight = Integer.parseInt(request.getParameter("weight"));
	height = height/100;
	
	double bmi = weight/(height*height);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	bmi 지수 계산 공식 = [체중(kg) / 신장(m)^2]
	즉, 175cm라면 실제 신장에 들어가야 하는 값은 1.75m
	* bmi지수가 23을 초과한다면 "체중조절을 고려해보세요." 출력
	18.5 미만이라면 "당신은 저체중입니다." 출력
	나머지인 경우 "당신은 정상 체중입니다." 를 출력하되
	스크립트릿에 if문을 넣어서 선택적으로 결과가 나오게 해 보세요.
	
	* 폼에서 전당되는 데이터는 무조건 문자열로 전달됩니다.
	따라서 정수나 실수로 변환해야 하는데
	String -> int, double
	Integer.parseInt("문자열") ==> 문자열을 정수로
	Double.parseDouble("문자열") ==> 문자열을 실수로
 -->
 
 <h2>BMI 결과</h2>
 <hr/>
 <p>- 신장 : <%= height*100 %>cm</p>
 <p>- 체중 : <%= weight %>kg</p>
 <%= bmi %>
 <% if(bmi>23){ %>
 	<p>체중 조절을 고려해보세요.</p>
 <% } else if(bmi<18.5){ %> 
	<p>당신은 저체중입니다.</p>
 <% } else{%>
	<p>당신은 정상 체중입니다.</p>
 <% } %>
 
</body>
</html>