<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    
<%

	// 자바에서 import 구문을 이용해 사용하던 클래스들은 JSP 파일에서도 역시
	// import 구문을 써야합니다.
	// 지시자(Directive)의 경우 <%@ % > 사이에 기술하여
	// 문서자체에 사용할 설정이나 옵션을 지정합니다.
	Date date = new Date(); // 날짜 얻어오기
	
	List<String> names = new ArrayList<>();
	// 이름 4개를 추가해보세요.
	names.add("이병건");
	names.add("주호민");
	names.add("김정환");
	names.add("심윤수");
	
	out.println(names.toString() + "<br/>");
	out.println(names.get(0) + "<br/>");
	
	out.println(date.getDate() + "<br/>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>