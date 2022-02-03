<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
List<Integer> lottoList = new ArrayList<>();
%>
<%
while(lottoList.size() < 6){
	int lottoNum = (int)(Math.random()*45 + 1);
	if(!lottoList.contains(lottoNum)){
		lottoList.add(lottoNum);
	}
}
Collections.sort(lottoList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로또번호 생성기</title>
</head>
<body>
<%
	for(Integer lottoNum : lottoList){
		out.println(lottoNum + "&nbsp;");
		Thread.sleep(700);
		out.flush();
	}
%>
</body>
</html>