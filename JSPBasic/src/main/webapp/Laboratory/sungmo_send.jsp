<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 미디어 쿼리 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	header {margin:0px; padding:20px; position:sticky; top:0px; background-color:white; border:solid 2px whitesmoke;}
	h1, h2 {text-align:center;}
	.col {padding:12px;}
	textarea {resize:none;}
	footer {
		width:100%;
		text-align:center;
		/* position:sticky */;
		left:0px;
		bottom:0px;
		}
	a {text-decoration:none;}
	
</style>
<title>근성체 번역기</title>
</head>
<body>

	<header>
	
		<h1>근성체 번역기 beta</h1>
		
	</header>

<div class="container-md">

	<div class="row">
	
		<div class="col">
			<h2>번역 전</h2>
			<form action="sungmo_getpost.jsp" method="get" style="text-align:center">
				<textarea name="text" placeholder="문장부호를 근성체에 맞게 바꿔줍니다.&#13;&#10;ex. '몰?루' > '몰!루'&#13;&#10;ex. '앗싸~ 좋구나!' > '앗싸~ 좋구나?'&#13;&#10;ex. '칫.. 결계인가..' > '칫?? 결계인가??' " rows="10" cols="34" resize="none"></textarea><br/>
				<input type="submit" class="btn btn-primary" value="번역"/>
			</form>
		</div>
		
		<div class="col">
			<h2>번역 후</h2>
			<div class="result">
			
				<form action="sungmo_getpost.jsp" method="get" style="text-align:center">
					<textarea name="text" rows="10" cols="34"></textarea><br/>
				</form>
					
			</div>
	
	</div>

</div>

<footer>
	<strong>어쩔코딩 실험실</strong><br/>
	<a href="https://mycodingnote.tistory.com/">https://mycodingnote.tistory.com/</a>
</footer>

</body>
</html>